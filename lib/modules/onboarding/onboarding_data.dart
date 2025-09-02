import 'package:flutter/material.dart';
import 'package:movies/core/constants/assets.dart';

class OnboardingModel {
  final String image;
  final String title;
  String? description;
  final List<Color>? gradientColors;

  OnboardingModel({
    required this.image,
    required this.title,
    this.description,
    this.gradientColors,
  });
}

List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    image: AppAssets.movies_posters_Img,
    title: "Find Your Next Favorite Movie Here",
    description:
        "Get access to a huge library of movies to suit all tastes. You will surely like it.",
    gradientColors: [
      Color(0xFF1E1E1E).withOpacity(0.0),
      Color(0xFF121312).withOpacity(0.5),
      Color(0xFF121312).withOpacity(0.9),
      Color(0xFF121312),
    ],
  ),
  OnboardingModel(
    image: AppAssets.herosImg,
    title: "Discover Movies",
    description:
        "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    gradientColors: [Color(0xFF084250).withOpacity(0.0), Color(0xFF084250)],
  ),
  OnboardingModel(
    image: AppAssets.godFatherImg,
    title: "Explore All Genres",
    description:
        "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    gradientColors: [Color(0xFF85210E).withOpacity(0.0), Color(0xFF85210E)],
  ),
  OnboardingModel(
    image: AppAssets.badBoysImg,
    title: "Create Watchlists",
    description:
        "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    gradientColors: [Color(0xFF4C2471).withOpacity(0.0), Color(0xFF4C2471)],
  ),
  OnboardingModel(
    image: AppAssets.doctorStrangeImg,
    title: "Rate, Review, and Learn",
    description:
        "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    gradientColors: [Color(0xFF601321).withOpacity(0.0), Color(0xFF601321)],
  ),
  OnboardingModel(
    image: AppAssets.hollywoodImg,
    title: "Start Watching Now",
    gradientColors: [Color(0xFF2A2C30).withOpacity(0.0), Color(0xFF2A2C30)],
  ),
];
