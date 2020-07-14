import 'package:flutter/material.dart';

import '../screens/list_search_screen.dart';

class SearchBar extends StatelessWidget {
  String _searchText = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(25),
        child: TextField(
          onChanged: (String _search) => _searchText = _search,
          controller: TextEditingController(text: _searchText),
          decoration: InputDecoration(
            hintText: 'Find Out Here!',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            suffixIcon: Material(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ListSearchScreen(searchText: _searchText),
                  ),
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
