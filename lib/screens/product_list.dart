import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 142, 75, 30),
          width: double.infinity,
          height: double.infinity,
          child: const Center(child: Text("ProductListScreen",style: TextStyle(fontSize: 40),)),
        ),
      ),
    );
  }
}
