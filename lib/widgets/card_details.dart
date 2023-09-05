import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardDetailsPage extends StatelessWidget {
  CardDetailsPage(
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
            height: 20,
          ),
          Text(
            title!,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
              letterSpacing: 4.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade200,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
