import 'package:flutter/material.dart';
import 'package:watchstore/screens/product_list.dart';

class BascketScreen extends StatelessWidget {
  const BascketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            // Navigator.pushNamed(context , ScreenNames.productListScreen);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductListScreen(),));
          }, child: const Text("view All")),

        ],
      ),
    );
  }
}
