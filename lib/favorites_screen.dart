import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'background.dart';  // Import your Background widget

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList('favorites');
    if (favorites != null) {
      setState(() {
        _favorites = favorites;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Favorites')),
      body: Background( // Use the Background widget
        child: _favorites.isEmpty
            ? Center(child: Text('No favorites added yet.'))
            : ListView.builder(
                itemCount: _favorites.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_favorites[index]),
                  );
                },
              ),
      ),
    );
  }
}
