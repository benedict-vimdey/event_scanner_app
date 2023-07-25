import 'package:flutter/material.dart';

class ActivityActions extends StatelessWidget {
  final String description;
  final String ImagePath;
  final Function()? onTap;
  ActivityActions({
    super.key,
    required this.description,
    required this.ImagePath,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 106.78,
        width: 120.31,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: Image.asset(ImagePath),
            ),
      
            const SizedBox(height: 10,),
      
            Text(description)
          ],
        ),
      ),
    );
  }
}