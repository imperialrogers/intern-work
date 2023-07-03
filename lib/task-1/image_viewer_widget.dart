import 'dart:io';
import 'package:flutter/material.dart';

class FileViewWidget extends StatelessWidget {
  final File file;
  const FileViewWidget({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        width: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: FadeInImage(
            placeholder: const NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHdwRaHjXM3PX6UYOW8Gz040wdMraGkNOlTcvdSj4&s"),
            image: FileImage(file),
          ),
        ),
      ),
    );
  }
}
