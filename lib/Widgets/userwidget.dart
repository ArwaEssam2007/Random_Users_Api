import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  String name, email, image;

  UserItem({
    required this.name,
    required this.email,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(image),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 20) ,
              ),
              Text(email , style: TextStyle(fontSize: 18),),
            ],
          ),
        ],
      ),
    );
  }
}