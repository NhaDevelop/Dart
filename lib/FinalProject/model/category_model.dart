class Category {
  final String emoji, name;

  var color;

  Category({required this.emoji, required this.name});
}

List<Category> categories = [
  Category(
    emoji: 'assets/IMG/smiling-face.png',
     name: 'Romance'),
  Category(
    emoji: 'assets/IMG/grinning-face.png',
    name: 'Comedy',
  ),
  Category(
    emoji: 'assets/IMG/horror.png',
    name: 'Horror',
  ),
  Category(
    emoji: 'assets/IMG/face.png',
    name: 'Drama',
  )
];
