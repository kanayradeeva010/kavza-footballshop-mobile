import 'package:flutter/material.dart';
import 'package:kavza_footballshop/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text("FEATURED", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),

                  const SizedBox(height: 12),

                  Text(product.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      )),

                  const SizedBox(height: 10),

                  Text("Price: Rp ${product.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      )),

                  const SizedBox(height: 10),

                  Text("Category: ${product.category}",
                      style: const TextStyle(fontSize: 16)),

                  const SizedBox(height: 10),

                  Text("Stock: ${product.productStock}",
                      style: const TextStyle(fontSize: 16)),

                  Row(
                    children: [
                      const Icon(Icons.visibility, size: 16),
                      const SizedBox(width: 4),
                      Text("${product.productViews} views"),
                    ],
                  ),

                  const Divider(height: 30),

                  const Text("Description:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),

                  const SizedBox(height: 8),

                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),

                  const SizedBox(height: 20),

                  Text("Product ID: ${product.id}", style: const TextStyle(color: Colors.grey)),
                  
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back to List"),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
