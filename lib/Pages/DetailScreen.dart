import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class Detailscreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: FutureBuilder<String?>(
        future: getImages("mask"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16,right: 16),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(
                    snapshot.data ?? '',
                    fit: BoxFit.fitHeight,
                    height: 280,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Error loading image');
                    },
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }
  Future<String?> getImages(String keyword) async {
    final response = await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$keyword&per_page=1'),
        headers: { 'Authorization': 'WthdNwKaDTT9QoR8GVc1krREKC98gPgWYHxr4EZVHa7gywROKdoR9lO9 ' }
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['photos'].isNotEmpty) {
        final topPhoto = data['photos'][0];
        return topPhoto['src']['original'];
      }
    }

    return null;
  }

  AppBar appBar(){
    return AppBar(
      title: Text("Detail"),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color: Colors.transparent,
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset("assets/icon_back.svg"),
        ),

      ),
    );
  }

}