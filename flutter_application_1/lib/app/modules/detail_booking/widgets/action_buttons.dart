import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1966FF), 
                    onPrimary: Colors.white, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Rent Now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18), 

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, 
                    onPrimary: const Color(0xFFFF3B30), 
                    side: const BorderSide(color: Color(0xFFFF3B30)), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Delete Book',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 18), 

              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9500), 
                    onPrimary: Colors.white, // Teks putih
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Update Book',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
