import 'package:flutter/material.dart';
import 'package:watchstore/screens/product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      width: double.infinity,
      height: double.infinity,
      child: ElevatedButton(onPressed: () {
        // Navigator.pushNamed(context , ScreenNames.productListScreen);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductListScreen(),));
      }, child: const Text("view All")),
    );
  }
}
