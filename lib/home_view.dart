import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quote_app/controllers/general_config_controller.dart';
import 'package:quote_app/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = '';
  String author = '';

  @override
  void initState() {
    fetchRandomQuote();
    super.initState();
  }

  Future<void> fetchRandomQuote() async {
    final res = await http.get(Uri.parse('https://api.quotable.io/random'));

    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      setState(() {
        quote = data['content'];
        author = data['author'];
      });
    } else {
      throw Exception('Failed to load random quote');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black87, BlendMode.darken)))),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Welcome To Quote App',
                      style: GoogleFonts.rocknRollOne(fontSize: 20, color: white),
                    ),
                  ),
                  const SizedBox(height: 150),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 54.0),
                    child: Column(
                      children: [
                        Text(
                          quote.isNotEmpty ? quote : 'Loading...',
                          style: GoogleFonts.rocknRollOne(fontSize: 20, color: white),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Text(
                          '-- ${author.isNotEmpty ? author : 'Loading...'}',
                          style: GoogleFonts.rocknRollOne(fontSize: 18, color: white),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: fetchRandomQuote,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                  child: Text('Get Another Quote')),
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
      ],
    );
  }
}
