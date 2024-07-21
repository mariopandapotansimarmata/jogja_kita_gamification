import 'package:flutter/material.dart';
import '../core/db/user_db.dart';
import '../core/model/user_model.dart';

class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  bool isLoading = false;
  bool isNewUser = true; // Assume it's always a new user for now

  UserDb userDb = UserDb.instance;

  List<UserModel> notes = [];

  @override
  void initState() {
    refreshNotes();
    super.initState();
  }

  Future<void> refreshNotes() async {
    final users = await userDb.readAll();
    setState(() {
      notes = users;
    });
  }

  Future<void> createNote() async {
    setState(() {
      isLoading = true;
    });

    final model = UserModel(
      name: nameController.text,
      userName: userNameController.text,
    );

    if (isNewUser) {
      await userDb.create(model);
    }

    setState(() {
      isLoading = false;
    });

    refreshNotes(); // Refresh the notes after creating a new one
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(labelText: "Username"),
                ),
                ElevatedButton(
                  onPressed: createNote, // Call the function here
                  child: isLoading ? CircularProgressIndicator() : Text("Save"),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: notes.isEmpty
                ? const Text(
                    'No Notes yet',
                    style: TextStyle(color: Colors.white),
                  )
                : ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  note.userId.toString(),
                                ),
                                Text(
                                  note.name.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(
                                  note.userName.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(
                                  note.exp.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
          )
        ],
      ),
    );
  }
}
