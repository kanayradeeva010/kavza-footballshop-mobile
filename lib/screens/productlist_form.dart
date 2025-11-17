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
    String _category = "shoes"; // default
    String _thumbnail = "";
    bool _isFeatured = false; // default

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
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Center(
                    child: Text(
                        'Add Product Form',
                    ),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            

            drawer: const LeftDrawer(),
            body: Form(
                key: _formkey,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            // === Name ===
                        Padding(padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Nama Produk",
                                    labelText: "Nama Produk",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),

                                onChanged: (String? value){
                                    setState(() {
                                      _name = value!;
                                    });
                                },
                                validator: (String? value){
                                if (value == null || value.isEmpty) {
                                    return "Nama tidak boleh kosong!";
                                }

                                if(value.length < 3){
                                    return "Nama produk minimal 3 karakter!";
                                }

                                if(value.length > 255){
                                    return "Nama produk terlalu panjang";
                                }
                                
                                return null;
                                },
                            ),

                            
                        ),

                        // === Price ===
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                            hintText: "Masukkan harga produk",
                            labelText: "Harga (IDR)",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                            ),
                            keyboardType: TextInputType.number, // keyboard angka
                            onChanged: (String? value) {
                            setState(() {
                                _price = int.tryParse(value ?? "0") ?? 0;
                            });
                            },
                            validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return "Harga tidak boleh kosong!";
                            }
                            final parsed = int.tryParse(value);
                            if (parsed == null) {
                                return "Masukkan angka yang valid!";
                            }
                            if (parsed <= 0) {
                                return "Harga harus lebih dari 0!";
                            }
                            
                            return null;
                            },
                        ),
                        ),


                        // === Description ===
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                            maxLines: 5,
                            decoration: InputDecoration(
                                hintText: "Deskripsi Produk",
                                labelText: "Deskripsi Produk",
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            onChanged: (String? value) {
                                setState(() {
                                _description = value!;
                                });
                            },
                            validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                return "Isi deskripsi produk tidak boleh kosong!";
                                }


                                return null;
                            },
                            ),
                        ),

                        // === Category ===
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                labelText: "Kategori",
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            value: _category,
                            items: _categories
                                .map((cat) => DropdownMenuItem(
                                        value: cat,
                                        child: Text(
                                            cat[0].toUpperCase() + cat.substring(1)),
                                    ))
                                .toList(),
                            onChanged: (String? newValue) {
                                setState(() {
                                _category = newValue!;
                                });
                            },

                            validator: (String? value){
                            if (value == null || value.isEmpty) {
                                return "Kategori harus dipilih!";
                            }
                                return null;
                            },

                            ),
                        ),


                        // === Thumbnail URL ===
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "URL Thumbnail",
                                labelText: "URL Thumbnail",
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            onChanged: (String? value) {
                                setState(() {
                                _thumbnail = value!;
                                });
                            },

                            validator: (String? value) {
            
                            if (value == null || value.isEmpty) {
                                 return "Isi URL tidak boleh kosong!";
                            }

                            // Cek format URL (regex sederhana)
                            final urlPattern = RegExp(
                                r'^(http|https):\/\/([\w\-]+\.)+[a-zA-Z]{2,}(\/\S*)?$',
                            );
                            if (!urlPattern.hasMatch(value)) {
                                return "Masukkan URL yang valid (contoh: https://example.com/gambar.jpg)";
                            }

                                return null;
                            },
                            ),
                        ),


                        // === Is Featured ===
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SwitchListTile(
                            title: const Text("Tandai sebagai Produk Unggulan"),
                            value: _isFeatured,
                            onChanged: (bool value) {
                                setState(() {
                                _isFeatured = value;
                                });
                            },
                            ),
                        ),

                        Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.indigo),
                            ),
                            onPressed: () async{
                                if (_formkey.currentState!.validate()) {
                                  final response = await request.postJson(
                                    "http://localhost:8000/create-flutter/",
                                    jsonEncode({
                                      "name": _name,
                                      "price": _price,
                                      "description": _description,
                                      "thumbnail": _thumbnail,
                                      "category": _category,
                                      "is_featured": _isFeatured,
                                    }),

                                  );
                                  if(context.mounted){
                                    if (response['status'] == 'success') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text("Products successfully saved!"),
                                      ));
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage()),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text("Something went wrong, please try again."),
                                      ));
                                    }
                                  }
                            
                                }
                            },
                            child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                            ),
                            ),
                        ),
                        ),

                    ],
                    ),
                ),
            ),
        );
    }
}