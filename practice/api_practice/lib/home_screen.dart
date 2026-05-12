import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:api_practice/models/posts_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<PostsModel>>? futurePosts;

  Future<List<PostsModel>> fetchPosts() async {
    final res = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    if (res.statusCode == 200) {
      List decoded = jsonDecode(res.body);
      return decoded.map((json) => PostsModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }

  void loadData() {
    setState(() {
      futurePosts = fetchPosts(); //  calling API only here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button Fetch API")),
      body: Column(
        children: [
          SizedBox(height: 20),

          ElevatedButton(onPressed: loadData, child: Text("Load Posts")),

          SizedBox(height: 20),

          Expanded(
            child: FutureBuilder<List<PostsModel>>(
              future: futurePosts, // listens to the future
              builder: (context, snapshot) {
                // case 1: no future yet (button not pressed)
                if (futurePosts == null) {
                  return Center(child: Text("Press the button to load data"));
                }

                // case 2: waiting
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                // case 3: error
                if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong"));
                }

                // case 4: success
                final posts = snapshot.data!;

                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
