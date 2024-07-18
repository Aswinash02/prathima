import 'package:flutter/material.dart';

Widget profileTextRow({required String text}){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Container(
        margin: const EdgeInsets.all(6),

        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green
        ),
      ),
      Expanded(
        child: Text(text),
      ),
    ],
  );
}