import 'package:flutter/material.dart';
import 'package:experiment_app1/FinalProject/Pages/reservation_screen.dart';
import 'package:experiment_app1/FinalProject/Widget/movie_info.dart';
import 'package:experiment_app1/FinalProject/const.dart';
import 'package:experiment_app1/FinalProject/model/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  final Color buttonColor;

  const MovieDetailPage({
    super.key,
    required this.movie,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Movie Detail",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0, // Remove shadow
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Hero(
                tag: movie.poster,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    movie.poster,
                    height: 350,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.white.withOpacity(0.3),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieInfo(
                  icon: Icons.category,
                  name: "Genre",
                  value: movie.genre,
                ),
                MovieInfo(
                  icon: Icons.timer,
                  name: "Duration",
                  value: formatTime(Duration(minutes: movie.duration)),
                ),
                MovieInfo(
                  icon: Icons.star,
                  name: "Rating",
                  value: "${movie.rating}/10",
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(
              color: Colors.white.withOpacity(0.3),
            ),
            const SizedBox(height: 20),
            const Text(
              "Synopsis",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              movie.synopsis,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: buttonColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ReservationScreen(),
            ),
          );
        },
        icon: const Icon(Icons.event_available),
        label: const Text(
          "Reserve",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
