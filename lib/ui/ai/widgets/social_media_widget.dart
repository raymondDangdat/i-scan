import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 95,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/earn.png'),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Earn from Social Media',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8999999761581421),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Complete tasks to earn',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8999999761581421),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
