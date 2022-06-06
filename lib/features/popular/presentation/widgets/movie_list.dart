import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/features/popular/data/models/popular_responce.dart';
import 'package:popular_movies/features/popular/presentation/cubit/popular_cubit.dart';
import 'package:popular_movies/features/popular/presentation/widgets/movie_card.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key, required this.movies, required this.isUploaded})
      : super(key: key);
  final List<Movie> movies;
  final bool isUploaded;

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _addScrollListener(context);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount:
            widget.isUploaded ? widget.movies.length + 1 : widget.movies.length,
        itemBuilder: ((context, index) {
          if (index == widget.movies.length) {
            return const Center(child: CircularProgressIndicator());
          }
          return MovieCard(movie: widget.movies[index]);
        }));
  }

  void _addScrollListener(BuildContext context) {
    return _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        context.read<PopularCubit>().uploadNext();
      }
    });
  }
}
