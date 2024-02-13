import 'package:netfl/api/api_const.dart';
import 'package:tmdb_api/tmdb_api.dart';

class APIService {
  static Future<Map> searchMovies(String query) async {
    TMDB tmdb = TMDB(ApiKeys(Constants.apiKey, Constants.readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    return await tmdb.v3.search.queryMovies(query);
  }

  static Future<Map> getTrendingMovies() async {
    TMDB tmdb = TMDB(ApiKeys(Constants.apiKey, Constants.readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    return await tmdb.v3.trending.getTrending();
  }

  static Future<Map> getTopRatedMovies() async {
    TMDB tmdb = TMDB(ApiKeys(Constants.apiKey, Constants.readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    return await tmdb.v3.movies.getTopRated();
  }

  static Future<Map> getPopularMovies() async {
    TMDB tmdb = TMDB(ApiKeys(Constants.apiKey, Constants.readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    return await tmdb.v3.movies.getPopular();
  }
}
