
import 'package:flutter/material.dart';


class DetailsColumn extends StatelessWidget {
  const DetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("Mayank Dubey"),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 0, 128, 128),
                  )
                ],
              ),
              Text(
                "This is not your username or pin. This name will be visible to your Whatsapp contacts.",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.info_outline,
            color: Colors.grey,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text("🇮🇳🇮🇳🇮🇳"),
                ],
              ),
              Icon(
                Icons.edit,
               color: Color.fromARGB(255, 0, 128, 128),
              )
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.call,
            color: Colors.grey,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Phone",
                style: TextStyle(color: Colors.grey),
              ),
              Text("6393201814"),
            ],
          ),
        ),
      ],
    );
  }
}
