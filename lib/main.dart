import 'dart:ui';

import 'package:develop_simple_quotes_app_01/request_api_02.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data2.dart';
import 'request_api_01.dart';
import 'data1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String imageUrl = 'https://source.unsplash.com/random/?nature,day';
  String quote = '';

  void getImage() async {
    Welcome? randomImage = await ApiRequest().fetchImage();
    imageUrl = randomImage!.url;
    setState(() {});
  }

  void getQuote() async {
    Welcome2? randomQuote = await ApiRequest2().login2();
    String finalQuote = '${randomQuote!.content}\n-${randomQuote.author}';
    setState(() {
      quote = finalQuote;
    });
  }

  @override
  void initState() {
    super.initState();
    getImage();
    getQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            color: Colors.white.withOpacity(0.3),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Column(
                    children: [
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 10),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            quote,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Color(0x94000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          getImage();
          getQuote();
        },
        child: const Icon(
          Icons.refresh,
          size: 55,
          color: Color(0x94000000),
        ),
      ),
    );
  }
}
