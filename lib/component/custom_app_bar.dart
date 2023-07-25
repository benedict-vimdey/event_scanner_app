import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String? text;
  const CustomAppBar({
    super.key,
    this.text = '', // This idea is from chat gpt. Yet to test if the idea is good or nah 
  });

  @override
  Widget build(BuildContext context) {
    onTap(){
      Navigator.pop(context);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset("lib/images/back.png")
        ),

        Text(text!,style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),

        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.all(16),
          child: Image.asset("lib/images/Path 1.png")
        )
      ],
    );
  }
}