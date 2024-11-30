class TMDBApi {
  final String _apiKey = 'c1f46d17355ae2cb31a99e2888a39a48';
  final String _baseUrl = 'api.themoviedb.org';

  // Trending Movies
  Uri trendingMovies(int page) =>
      _buildUri(endpoint: 'trending/movie/week', page: page);

  // Popular Movies
  Uri popularMovies(int page) =>
      _buildUri(endpoint: 'movie/popular', page: page);

  // Upcoming Movies
  Uri upcomingMovies(int page) =>
      _buildUri(endpoint: 'movie/upcoming', page: page);

  // Now Playing Movies
  Uri nowPlayingMovies(int page) =>
      _buildUri(endpoint: 'movie/now_playing', page: page);

  // Top Rated Movies
  Uri topRatedMovies(int page) =>
      _buildUri(endpoint: 'movie/top_rated', page: page);

  // Single Movie by ID
  Uri movie(int movieId) => _buildUri(endpoint: 'movie/$movieId');

  // Movie Details with Append to Response (Credits, Similar, and Videos)
  Uri movieDetails(int movieId) =>
      _buildUri(endpoint: 'movie/$movieId', query: {
        'append_to_response': 'credits,similar,videos'
      }); // Added 'videos'

  // Image URL
  Uri image(String imagePath) =>
      Uri.parse('https://image.tmdb.org/t/p/w500$imagePath');

  // Helper Method to Build URIs
  Uri _buildUri({
    required String endpoint,
    int? page,
    Map<String, dynamic>? query,
  }) {
    Map<String, dynamic> queryParameters = {
      'api_key': _apiKey,
      if (page != null) 'page': page.toString(),
    };

    if (query != null) {
      queryParameters.addAll(query);
    }

    return Uri(
      scheme: 'https',
      host: _baseUrl,
      path: '/3/$endpoint',
      queryParameters: queryParameters,
    );
  }
}
