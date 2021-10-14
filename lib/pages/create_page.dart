import 'package:flutter/material.dart';
import 'package:patterns_scoped/scopes/create_scoped.dart';

class CreatePage extends StatefulWidget {
  static final String id = 'create_page';

  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateScoped scoped = CreateScoped();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new post'),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Title
                Container(
                  height: 75,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: TextField(
                      controller: scoped.titleTextEditingController,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                // Body
                Container(
                  height: 475,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: scoped.bodyTextEditingController,
                    style: const TextStyle(fontSize: 18),
                    maxLines: 30,
                    decoration: const InputDecoration(
                      labelText: 'Body',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          scoped.isLoading ? const Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        onPressed: () {
          scoped.apiPostCreate(context);
        },
        child: const Icon(Icons.file_upload),
      ),
    );
  }
}
