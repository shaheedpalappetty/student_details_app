// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  CardItemWidget(
      {super.key,
      //  this.cardController,
      this.value,
      this.title});
  String? value;
  String? title;
  // final CardController? cardController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            title!,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
              letterSpacing: 4.0,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            value!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade200,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
