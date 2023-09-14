import 'package:flutter/material.dart';

import 'book_page.dart';
import 'books.dart';

class CreateSearch extends StatelessWidget {
  const CreateSearch({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySearchBar(),
    );
  }
}

// Search by Show Search.

class MySearchBar extends StatefulWidget {
  const MySearchBar({ Key? key }) : super(key: key);

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  final controller = TextEditingController();
  List<Book> books = allBooks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Book Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.blue)
                )
              ),
              onChanged: searchBook,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder:(context, index) {
                final book = books [index];

                return ListTile(
                  leading: Image.network(
                    book.urlImage,
                    fit: BoxFit.cover,
                    height: 50, width: 50,
                  ),
                  title: Text(book.title),
                  onTap: () => Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => BookPage(book: book),
                    )
                  ),
                );
              }
            )
          )
        ],
      ),
    );
  }
  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();

    setState(() => books = suggestions);
  }
}

class MySearchDelegate extends SearchDelegate {
  // if (This is Advanced work. One letter type for suggestion one Carecter selected)
  
  // List<String> searchResults = [
  //   'Iran'
  //   'Japan'
  //   'Koria'
  //   'London'
  //   'Maloyatia'
  //   'Nepal'
  //   'Qatar'
  // ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null)
  );

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
        }
      },
    )
  ];

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
      style: const TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.bold
      ),
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      'Argentina'
      'Bangladesh'
      'Canada'
      'Dubai'
      'England'
      'France'
      'German'
      'Hungery'
    ];
    
    // else (This is Advanced work. One letter type for suggestion one Carecter selected)

    // List<String> suggestions = searchResults.where((searchResult) {
    //   final result = searchResult.toLowerCase();
    //   final input = query.toLowerCase();

    //   return result.contains(input);
    // }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions [index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;

            showResults(context);
          },
        );
      }
    );
  }

}