import 'package:flutter/material.dart';
import 'package:kavza_footballshop/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:kavza_footballshop/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formkey = GlobalKey<FormState>();

  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "shoes";
  int _product_stock = 0;
  int _product_views = 0;
  String _thumbnail = "";
  bool _isFeatured = false;

  final List<String> _categories = [
    'shoes',
    'apparel',
    'accessories',
    'training',
    'equipment',
    'ball',
    'fans',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>(); // penting!

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              
              // NAME
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nama Produk",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _name = value,
                validator: (value) =>
                    value == null || value.isEmpty ? "Nama tidak boleh kosong!" : null,
              ),

              const SizedBox(height: 12),

              // PRICE
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Harga (IDR)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    _price = int.tryParse(value) ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Harga tidak boleh kosong!";
                  if (int.tryParse(value) == null) return "Masukkan angka valid!";
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // DESCRIPTION
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                onChanged: (value) => _description = value,
              ),

              const SizedBox(height: 12),

              // CATEGORY
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: "Kategori",
                  border: OutlineInputBorder(),
                ),
                value: _category,
                items: _categories
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (value) => _category = value!,
              ),

              const SizedBox(height: 12),

              // STOCK
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Stok",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    _product_stock = int.tryParse(value) ?? 0,
              ),

              const SizedBox(height: 12),

              // THUMBNAIL
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "URL Thumbnail",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _thumbnail = value
              ),

              // FEATURED SWITCH
              SwitchListTile(
                title: const Text("Featured Product?"),
                value: _isFeatured,
                onChanged: (value) => setState(() => _isFeatured = value),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    final response = await request.post(
                      "http://127.0.0.1:8000/auth/create-flutter/",
                      jsonEncode({
                        "name": _name,
                        "price": _price,
                        "description": _description,
                        "category": _category,
                        "product_stock": _product_stock,
                        "product_views": _product_views,
                        "thumbnail": _thumbnail,
                        "is_featured": _isFeatured,
                      }),
                    );

                    if (!context.mounted) return;

                    if (response['status'] == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Produk berhasil disimpan!"),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => MyHomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Gagal menyimpan data!"),
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
