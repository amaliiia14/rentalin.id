import 'package:flutter/material.dart';

class VehicleInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/Rectangle10.png',
              width: screenWidth * 0.4,
              height: screenWidth * 0.4,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16), 
          Expanded(
            child: Container(
              padding: EdgeInsets.all(13), 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Honda',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'PCX 2024',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                  Text(
                    'KH 1231 WG',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'Type Matic',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(height: 8), 
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 18, 
                      ),
                      children: [
                        TextSpan(
                          text: 'Rp. 150.000',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1966FF),
                          ),
                        ),
                        TextSpan(
                          text: '/Day',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
