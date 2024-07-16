import 'package:flutter/material.dart';
import 'package:prathima_loan_app/utils/colors.dart';

PreferredSizeWidget homeAppBar() {
  return AppBar(
    title: Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 35,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                filled: true,
                fillColor: MyTheme.light_grey,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        )
      ],
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Icon(Icons.notifications),
      )
    ],
  );
}
