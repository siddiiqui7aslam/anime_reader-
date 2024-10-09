import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'background.dart';  // Import your Background widget

class DetailScreen extends StatefulWidget {
  final String webtoonTitle;
  final String webtoonImage;
  final String webtoonCreator;
  final String webtoonGenre;
  final String webtoonDescription;

  DetailScreen({
    required this.webtoonTitle,
    required this.webtoonImage,
    required this.webtoonCreator,
    required this.webtoonGenre,
    required this.webtoonDescription,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<int> ratings = [];
  double averageRating = 0.0;

  void _addRating(int rating) {
    setState(() {
      ratings.add(rating);
      averageRating = ratings.isNotEmpty
          ? ratings.reduce((a, b) => a + b) / ratings.length
          : 0.0;
    });
  }

  Future<void> _addToFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList('favorites') ?? [];

    // Check if the webtoon is already in favorites
    if (!favorites.contains(widget.webtoonTitle)) {
      favorites.add(widget.webtoonTitle);
      await prefs.setStringList('favorites', favorites);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.webtoonTitle} added to favorites!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.webtoonTitle} is already in favorites!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.webtoonTitle),
      ),
      body: Background( // Use the Background widget
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(widget.webtoonImage),
              SizedBox(height: 10),
              Text(widget.webtoonTitle, style: TextStyle(fontSize: 24)),
              Text('Creator: ${widget.webtoonCreator}', style: TextStyle(fontSize: 16)),
              Text('Genre: ${widget.webtoonGenre}', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text(widget.webtoonDescription),
              SizedBox(height: 10),
              Text('Average Rating: ${averageRating.toStringAsFixed(1)} ★', style: TextStyle(fontSize: 20)),
              Spacer(), // Pushes the buttons to the bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Rating section at the bottom left
                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < averageRating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        ),
                        onPressed: () => _addRating(index + 1),
                      );
                    }),
                  ),
                  // Add to Favorites button at the bottom right
                  ElevatedButton(
                    onPressed: _addToFavorites,
                    child: Text('Add to Favorites'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
