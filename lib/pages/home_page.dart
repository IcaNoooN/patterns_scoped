import 'package:flutter/material.dart';
import 'package:patterns_scoped/scopes/home_scoped.dart';
import 'package:patterns_scoped/views/item_of_post.dart';
import 'package:scoped_model/scoped_model.dart';

import 'create_page.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
HomeScoped scoped = HomeScoped();

  @override
  void initState() {
    super.initState();
    scoped.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetState'),
      ),
      body: ScopedModel<HomeScoped>(
        model: scoped,
        child: ScopedModelDescendant<HomeScoped>(
          builder: (ctx, model, index) => Stack(
            children: [
              ListView.builder(
                itemCount: scoped.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPosts(context, scoped, scoped.items[index]);
                },
              ),

              scoped.isLoading ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, CreatePage.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}