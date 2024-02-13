import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart'; 

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  List<dynamic> searchMoviesList = [];
  final String apiKey = 'ece5b87eda737366de7f2c96ce1d6631';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2U1Yjg3ZWRhNzM3MzY2ZGU3ZjJjOTZjZTFkNjYzMSIsInN1YiI6IjY1YzRhOGU5MDIxY2VlMDE4M2MzMWY0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wWtwACViSyREuf4ToWiDtPi_g6WTI76_eM6D0vi2sug'; // Replace with your actual access token

  void searchMovies(String query) async {
    TMDB tmdb = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map searchResult = await tmdb.v3.search.queryMovies(query);
    setState(() {
      searchMoviesList = searchResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onSubmitted: (query) => searchMovies(query),
              decoration: InputDecoration(
                hintText: 'Search for movies...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: searchMoviesList.isNotEmpty
                  ? ListView.builder(
                      itemCount: searchMoviesList.length,
                      itemBuilder: (context, index) {
                        Map movieData = searchMoviesList[index];

                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 120.0,
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w200${movieData['poster_path']}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movieData['title'],
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        movieData['overview'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4.0),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.amber, size: 16.0),
                                          Text(
                                            '${movieData['vote_average']}',
                                            style: TextStyle(fontSize: 12.0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('No results found.'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
