// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netfl/movies.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendngmovies = [];
  List topratedmovies = [];
  List newreleasedmovies = [];
  List popularmovies = [];
  final String apiKey = 'ece5b87eda737366de7f2c96ce1d6631';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2U1Yjg3ZWRhNzM3MzY2ZGU3ZjJjOTZjZTFkNjYzMSIsInN1YiI6IjY1YzRhOGU5MDIxY2VlMDE4M2MzMWY0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wWtwACViSyREuf4ToWiDtPi_g6WTI76_eM6D0vi2sug';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  
  loadMovies() async {
    TMDB tmdbWithCustemLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustemLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustemLogs.v3.movies.getTopRated();
    Map popularresult = await tmdbWithCustemLogs.v3.movies.getPopular();
    print(trendingresult);
    setState(() {
      trendngmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      popularmovies = popularresult['results'];
    });
      print(trendngmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 35,
        
        
        backgroundColor: Colors.black.withOpacity(0.3),
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
