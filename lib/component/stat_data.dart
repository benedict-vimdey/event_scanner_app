import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class StatData extends StatelessWidget {
  final String title;
  final int figure;

  StatData({
    super.key,
    required this.title,
    required this.figure
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0152DF),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image.asset("lib/images/trending_up.png"),
                ),

                const SizedBox(width: 10,),
            
                Expanded(child: Text(title, style: TextStyle(fontSize: 13),))
              ],
            ),
          ),

          const SizedBox(height: 5,),

          Text(figure.toString(),style: TextStyle(fontSize: 25),)

        ],
      ),
    );
  }
}