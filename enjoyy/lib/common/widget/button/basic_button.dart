import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const BasicButton({
    required this.onPressed,
    required this.title,
    this.height, // Tidak perlu menggunakan required karena nilainya bisa null
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize:
            Size(double.infinity, height ?? 64), // Lebar diatur agar responsif
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16), // Padding untuk memberikan ruang dalam tombol
      ),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            color: Colors
                .white), // Menambahkan font size agar terlihat lebih konsisten
      ),
    );
  }
}
