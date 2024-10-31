
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/randomUserProvider.dart';
import '../Widgets/userwidget.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider providerObject = UserProvider.getObject(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(" Users" , style: TextStyle(color: Colors.white, fontSize: 30,),),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final result = userProvider.userData?.result;

          if (result == null) {
            providerObject.fetchUsers();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
                final user = result[index];

                return UserItem(
                  name: user["name"],
                  email: user["email"],
                  image: user["image"],
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 20 , color: Colors.grey,),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: ()  {
          providerObject.fetchUsers();
        },
        child: const Icon(Icons.refresh , ),
      ),
    );
  }
}
