// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_if_null_operators, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:netfl/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({
    super.key,
    required this.trending,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trenting Now',
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 13),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Toprateddiscribtion(name: trending[index]['title'],
                               description: trending[index]['overview'], bannerurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                               posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                                vote: trending[index]['vote_average'].toString(), lounch_on: trending[index]['release_date'])));
                    },
                    child: trending[index]['title'] != null ? Container(
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 20,
                            child: Text(
                              trending[index]['title'] != null
                                  ? trending[index]['title']
                                  : 'loading',
                            ),
                          ),
                        ],
                      ),
                    ):Container(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class PopularMovies extends StatelessWidget {
  final List popular;

  const PopularMovies({
    super.key,
    required this.popular,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular on Netflix',
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            height: 230,
            // color: Colors.amber,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popular.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 13),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Toprateddiscribtion(name: popular[index]['title'],
                               description: popular[index]['overview'], bannerurl: 'https://image.tmdb.org/t/p/w500'+popular[index]['backdrop_path'],
                               posterurl: 'https://image.tmdb.org/t/p/w500'+popular[index]['poster_path'],
                                vote: popular[index]['vote_average'].toString(), lounch_on: popular[index]['release_date'])));
                    },
                    child:  popular[index]['title'] != null ?Container(
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      popular[index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: Text(
                              popular[index]['title'] != null
                                  ? popular[index]['title']
                                  : 'loading',
                            ),
                          ),
                        ],
                      ),
                    ): Container(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class topratedMovies extends StatelessWidget {
  final List toprated;

  const topratedMovies({
    super.key,
    required this.toprated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Rated',
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 13),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Toprateddiscribtion(name: toprated[index]['title'],
                               description: toprated[index]['overview'], bannerurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                               posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                                vote: toprated[index]['vote_average'].toString(), lounch_on: toprated[index]['release_date'])));
                    },
                    child: toprated[index]['title'] != null? Container(
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: Text(
                              toprated[index]['title'] != null
                                  ? toprated[index]['title']
                                  : 'loading',
                            ),
                          ),
                        ],
                      ),
                    ): Container(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
