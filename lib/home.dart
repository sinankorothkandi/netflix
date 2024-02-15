// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netfl/movies.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendngmovies = [];
  List topratedmovies = [];
  List popularmovies = [];
  final String apiKey = 'ece5b87eda737366de7f2c96ce1d6631';


  @override
  void initState() {
    loadMovies();
    super.initState();
  }

 loadMovies() async {
  final String trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey';
  final String topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
  final String popularUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

  final trendingResponse = await http.get(Uri.parse(trendingUrl));
  final topRatedResponse = await http.get(Uri.parse(topRatedUrl));
  final popularResponse = await http.get(Uri.parse(popularUrl));

  if (trendingResponse.statusCode == 200 &&
      topRatedResponse.statusCode == 200 &&
      popularResponse.statusCode == 200) {
    final trendingData = jsonDecode(trendingResponse.body);
    final topRatedData = jsonDecode(topRatedResponse.body);
    final popularData = jsonDecode(popularResponse.body);

    setState(() {
      trendngmovies = trendingData['results'];
      topratedmovies = topRatedData['results'];
      popularmovies = popularData['results'];
    });
  } else {
      print('data not fetched');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.transparent,
        leading: Image(
          image: AssetImage("images/netfologo.png"),
          fit: BoxFit.contain,
        ),
        title: Row(
          children: [
            Text('TV Shows',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            Spacer(),
            Text('Movies', style: TextStyle(color: Colors.white, fontSize: 16)),
            Spacer(),
            Text('My List',
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CarouselSlider(
              items: [
                Image.asset('images/theplatform.jpg'),
                Image.asset('images/bettercallsaul.jpg'),
                Image.asset('images/lotr.jpg'),
                Image.asset('images/number.jpg'),
              ],
              options: CarouselOptions(
                height: 550,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 450,
              ),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  PopularMovies(popular: popularmovies),
                  TrendingMovies(trending: trendngmovies),
                  topratedMovies(toprated: topratedmovies)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
