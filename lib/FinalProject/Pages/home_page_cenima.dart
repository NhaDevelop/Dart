import 'dart:math';
import 'package:flutter/material.dart';
import 'package:experiment_app1/FinalProject/Pages/detail_page.dart';
import 'package:experiment_app1/FinalProject/const.dart';
import 'package:experiment_app1/FinalProject/model/category_model.dart';
import 'package:experiment_app1/FinalProject/model/movie_model.dart';

class HomePageCinema extends StatefulWidget {
  const HomePageCinema({super.key});

  @override
  State<HomePageCinema> createState() => _HomePageCinemaState();
}

class _HomePageCinemaState extends State<HomePageCinema> {
  late PageController controller;
  double pageOffset = 1;   //pageOffset variable is used to keep track of the current page.
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    // Initialize PageController for the movie carousel
    controller = PageController(
      initialPage: 1,
      viewportFraction: 0.7,
    )..addListener(() {
        setState(() {
          pageOffset = controller.page!;
        });
      });
  }

  @override
  void dispose() {
    // Dispose of the PageController to free resources
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: headerBar(), // Reusable AppBar
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Search Field
              searchField(),

              const SizedBox(height: 30),

              // Categories Section
              const Text(
                "Categories",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              categoryChips(categories), // Scrollable category chips

              const SizedBox(height: 30),

              // Movie Section
              const Text(
                "Showing This Month",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              movieCarousel(), // Carousel for movies

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// Header AppBar
  AppBar headerBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Ronan👋",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white54,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Let's relax and watch a movie!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // Profile Image
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://t3.ftcdn.net/jpg/06/07/84/82/240_F_607848231_w5iFN4tMmtI2woJjMh7Q8mGvgARnzHgQ.jpg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Search Field
  Widget searchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search movies...",
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// Category Chips
  Widget categoryChips(List<Category> categories) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Chip(
              backgroundColor: Colors.blueGrey.shade800,
              label: Text(
                category.name,
                style: const TextStyle(color: Colors.white),
              ),
              avatar: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(category.emoji),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.5),
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Movie Carousel
  Widget movieCarousel() {
    return SizedBox(
      height: 420, // Increased height for a more immersive design
      child: PageView.builder(
        controller: controller,
        itemCount: movies.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index % movies.length;
          });
        },
        itemBuilder: (context, index) {
          // Pass movie data to the movie card widget
          return movieCard(index);
        },
      ),
    );
  }

  /// Individual Movie Card
  Widget movieCard(int index) {
    final movie = movies[index % movies.length];
    double scale = max(0.8, (1 - (pageOffset - index).abs()) + 0.2);

    return Transform.scale(
      scale: scale,
      child: GestureDetector(
        onTap: () {
          // Navigate to the movie detail page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  MovieDetailPage(movie: movie, buttonColor: buttonColor),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 5),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(movie.poster),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Gradient overlay at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Movie Title
                        Text(
                          movie.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        // Movie Genre
                        Text(
                          movie.genre,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
