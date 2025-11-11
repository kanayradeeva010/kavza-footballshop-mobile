import 'package:flutter/material.dart';
import 'package:kavza_footballshop/widgets/product_card.dart';
import 'package:kavza_footballshop/widgets/left_drawer.dart';




class MyHomePage extends StatelessWidget {
    MyHomePage({super.key});

    final String nama = "Kanayra Maritza Sanika Adeeva";//nama
    final String npm = "2406437880"; //npm
    final String kelas = "C";//kelas

    final List<ItemHomepage> items = [
      ItemHomepage("All Products", Icons.storefront, Colors.blue),
      ItemHomepage("My Products", Icons.inventory_2, Colors.green),
      ItemHomepage("Create Product", Icons.add_box, Colors.red),

    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Kavza Football Shop',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
            ),
          ),
            backgroundColor: Colors.deepPurple,
          ),
          
          drawer: const LeftDrawer(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoCard(title: 'NPM', content: npm),
                    InfoCard(title: 'Name', content: nama),
                    InfoCard(title: 'Class', content: kelas),
                  ],
                ),

                const SizedBox(height: 16.0),

                Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Selamat datang di Kavza Football Shop',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),

                      GridView.count(
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        // Agar grid menyesuaikan tinggi kontennya.
                        shrinkWrap: true,

                        // Menampilkan ItemCard untuk setiap item dalam list items.
                        children: items.map((ItemHomepage item) {
                          return ItemCard(item);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
    }
}


class ItemHomepage {
 final String name;
 final IconData icon;
 final Color color;

 ItemHomepage(this.name, this.icon, this.color);
}


class InfoCard extends StatelessWidget{
  final String title;  // Judul kartu.
  final String content;  // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});
  @override
  Widget build(BuildContext context) {
    return Card(
      // Membuat kotak kartu dengan bayangan dibawahnya.
      elevation: 2.0,
      child: Container(
        // Mengatur ukuran dan jarak di dalam kartu.
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}



