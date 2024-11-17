class Joke {
  final String title;
  final String description;

  Joke(this.title, this.description);
}

final List<Joke> jokes = List.generate(
  20,
  (index) => Joke(
    'Joke Title $index',
    'This is the description for joke number $index.',
  ),
);
