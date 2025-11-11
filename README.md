# kavza_footballshop


## Tugas Individu 7 
## Kanayra Maritza Sanika Adeeva
## PBP C - 2406437880


Jawab pertanyaan-pertanyaan berikut di file README.md pada folder root:

 Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
 Answer : 
 Dalam Flutter, widget tree adalah struktur hierarki yang menggambarkan bagaimana semua widget dalam aplikasi tersusun dan saling berhubungan. Semua yang terlihat di layar dalam aplikasi Flutter—seperti teks, tombol, gambar, layout, dan bahkan keseluruhan halaman adalah widgetm satu widget bisa memiliki satu atau lebih anak (child). Tree  ini dimulai dari root widget biasanya MaterialApp, lalu bercabang ke widget-widget lain seperti contohnya Scaffold, AppBar, Column, Row, Text, dan sebagainya. 
 
 Hubungan parent-child menentukan bagaimana widget : 
 - menentukan layout jadi parent widget bertanggung jawab mengatur posisi dan ukuran anak-anaknya. misal column menata anak-anaknya secara vertikal, sedangkan row secara horizontal.
 - mewarisi properti dan konteks jadi widget child dapat mengakses informasi dari parent melalui konteks (misalnya, tema dari Theme.of(context)).
 - mendukung pembaruan tampilan jadi kalau parent di-rebuild, maka seluruh subtree (termasuk anak-anaknya) juga bisa ikut di-rebuild, tergantung pada apakah widget tersebut bersifat stateless atau stateful.

 dan disinni jenis hubugan umumnya ada dua yaitu :
 - Single child relationship contohnya Center, Container, Padding yang dimana dia hanya punya satu widget anak
 - Multi-child relationship contohnya Column, Row, Stack, ListView  yang dimana dia bisa punya banyak widget anak dalam daftar children : []


 Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
 Answer : 
 - MaterialApp :  sebagai widget root dari aplikasi flutter, mengatur tema, judul aplikasi, serta halaman awal (home), juga memberi akses ke fitur Material Design seperti Navigator, Scaffold, dan Theme.

 - Scaffold : kerangka utama tampilan halaman yang digunakan untuk menampung AppBar dan isi halaman utama

 - AppBar : sabagai top bar aplikasi yang menampilkan judul "Kavza Football Shop"

 - Column : menyusun widget child secara vertikal dan mengatur urutan konten

 - Row : menyusun widget child secara horizontal dan disin idipakai untuk menampilkan 3 infocard yang isinya npm, nama dan kelas sejajar. 

 - Padding : memberi jarak sekitar widget agar tampilan rapi

 - Card : menampilkan konten dalam kotak dengan bayangan supaya terlihat seperti kartu

 - Text : menampilkan teks statis dan dinamis di layar, digunakan di banyak bagian seperti judul, label, dan pesan SnackBar

 - GridView.count : menyusun beberapa widget anak dalam bentuk grid ini dipakai untuk menampilkan daftar menu ItemCard seperti All Products, My Products, dan Create Product dalam tiga kolom.

 - Container : wadah buat ngatur ukuran, padding dan warna, dipakai dalam InfoCard dan ItemCard untuk mengatur tata letak dan padding elemen di dalamnya.

 - Material : memberi efek visual material design seperti warna latar belakang dan ripple effect saat ditekan.

 - InkWell : memberi efek sentuhan klik pada widget igunakan dalam ItemCard untuk menampilkan SnackBar saat pengguna menekan salah satu menu.

 - SnackBar : menampilkan pesan sementara di bagian bawah layar untuk memberi umpan balik kepada pengguna, dii sini dipakai untuk menampilkan teks seperti “Kamu telah menekan tombol All Products!” saat tombol ditekan.

 - Icon : menampilkan ikon visual untuk memperjelas fungsi setiap menu.

 - SizedBox : memberi jarak vertikal atau horizontal antar widget.

 - MediaQuery : mengambil ukuran layar perangkat agar elemen bisa menyesuaikan secara responsif.
 

 Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
 Answer : 
 MaterialApp adalah widget utama yang dipakai untuk membangun aplikasi Flutter dengan gaya desain material design dari Google dan material design itu sendiri adalah sistem design visual yang memastikan aplikasi jadi konsisten, intuitif dan modern di berbagai perangkat maupun web. Alasan dia hampir selalu dipakai sebagai widget root adalah karena MateriapApp menyediakan BuildContext yaitu dengan memberi akses ke Theme, Navigator, MediaQuery, dan Localizations. Lalu, semua widget di bawahnya dapat otomatis mengikuti gaya visual (warna, font, bentuk tombol) tanpa harus diatur satu per satu. Selain itu, MaterialApp menyediakan Navigator dan Route secara otomatis sehingga perpindahan antar halaman mudah dilakukan.


 Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
 Answer:
 Keduanya adalah jenis widget utama di Flutter yang berbeda dalam cara mereka menangani perubahan state. Perbedaannya adalah pada stateless widget dia tidak memiliki state yang bisa berubah jadi semua tampilannya tetap selama aplikasi berjalan, cara biar tampilannya berubah adalah dengan dibangun ulang oleh parentnya. Stateless widget cocok dipakai untuk komponen yang statis spt teks, ikon, atau tombol yang tidak berubah isi tampilannya. Sedangkan stateful widget punya state yang bisa berubah selama aplikasi berjalan, saat state berubah akibat interaksi pengguna atau data baru, Flutter bakal manggil ulang build () untuk memperbarui tampilan. Ini cocok untuk komponen yang dinamis seperti form input, counter. Saya memilih statelesswidget jika tampilannya tidak bergantuk pada perubahan data atau interaksi user, lalu saya memakai stateful widget kalo tampilannya perlu berubah dynamically based on user's action. 
 

 Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
 Jawab:
 BuildContext adalah jembatan yang menghubungi widget dan lingkungan tempat ia dibangun.  Jadi buildcontext ini merepresentasikan lokasi sebuah widget dalam widget tree di Flutter. Tiap widget dibangun ia punya buildcontext sendiri dan ini dipake untuk ngehubungin widget dengan elemen elemen lain di atas atau di bawahnya dalam struktur aplikasi. Jadi dengan buildcontext widget tau dimana posisinya berada pada hierarki UI aplikasi. Ini ppenting karena widget dapat akses data dan tema dari parent widget contoh warna, font, atau gaya yang didefinisiin di MaterialApp atau Theme, lalu melakukan navigasi antar halaman, kemudian mengambil ukuran layar melalui MediaQuery.of(context).size dan nentuin relasi antar widget. Penggunaannya di method build() adalah sebagai parameter utama, contohnya seperti ini:

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Contoh BuildContext'),
    ),
    body: Center(
      child: Text(
        'Ukuran layar: ${MediaQuery.of(context).size.width}',
      ),
    ),
  );
}

jadi context dikirim oleh Flutter otomatis saat dipangggil build() melalui context ini, widget Text bisa akses informasi tentang ukuran layar dari MediaQuery. 


 Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
 Jawab:
 Jadii hot reload adalah fitur di Flutter yang memungkinkan perubahan kode ditampilkan langsung di aplikasi tanpa kehilangan state yang sedang berjalan. Dengan ini, Flutter hanya memuat ulang bagian kode yang berubah aja tidak menghentikan aplikasi atau mengilang proses dari awal. Bedanya dengan hot restart adalah hot restart juga memperbarui kode yang diubah tapi seluruh staate aplikasi direset ke kondisi awal, jadi seolah olah aplikasinya baru dijalankan dari awal dan membangun ulang semua widget dari root main() sehingga variabel, input, dan data sementara ilang.  

## Tugas Individu 8
## Kanayra Maritza Sanika Adeeva
## PBP C - 2406437880
 Menjawab beberapa pertanyaan berikut pada README.md pada root folder (silakan modifikasi README.md yang telah kamu buat sebelumnya dan tambahkan subjudul untuk setiap tugas):

 Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
 Jawab: 
 Navigator.push menambah halaman baru ke atas stack navigasi, namun kalau Navigator.pushReplacement mengganti halaman saat ini dengan halaman yang baru. Pada navigator push halaman sebelumnya tetap tersimpan di dalam stack, sehingga pengguna dapat kembali ke halaman sebelumnya dengan tombol back, namun pada navigator push replacement halaman sebelumnya dihapus dari stack jadi penggun atidak bisa kembali ke halaman sebelumnya.  Dalam konteks apps saya navigator.push dipakai saat pengguna hanya mengunjungi sementara halaman baru misal pada tombol create product di itemcard kita mau buka halaman form untuk nambah produk (ProductFormPage) lalu setelah selesai menambah produk user bisa balk ke MyHomePage dengan menekan back. Disinilah Navigator.push cocok karena hanya sementara pindah halaman. Maka ini diletakkan di ItemCard dan LeftDrawer. Lalu untuk Navigator.pushReplacement dipakai saat halaman ga perlu diakses lagi, misal di LeftDrawer ketika user milih menu Home halaman sebelumnya tidak perlu disimpan lagi karena ketika kembali ke home ada alasan untuk kembali ke halaman form. Disini maka Push Replacement dipakai pada LeftDrawer di bagian menu Home. 

 Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
 Jawab :
 Jadi disini Scaffold sebagai struktur dasar tiap page di aplikasi dan dia menyediakan area untuk elemen penting contoh AppBar di atas Drawer di kiri dan Body untuk isi utama halaman. Scaffold ini dipakai di tiap halaman sehingga tampilan aplikasi saya seragam dan gampang dipahami user. 

 Lalu AppBar dipakai di bagian header tiap halaman yang fungsinya buat menampilkan judul halaman supaya user tau sedang dimana dan menyediakan aksi cepat misal tombol back search atau menu.

 Selanjutnya Drawer diakai untuk menu navigasi global yang muncul di semua halaman. Dalam apps ini drawer didefine di widget terpisah (LeftDrawer) dan dipakai kembali di tiap halaman melalui Scaffold. 
 contoh spt ini : drawer: const LeftDrawer(),



 Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
 Padding ini menambah jarak atau ruang kosong sekitar widget supaya elemen ga saling berimpitan dan ini membuat antarmuka lebih teratur, nyaman dilihat dan mudah dipakai pengguna. Sehingga jarak antar komponen menjadi konsisten. Contoh penggunaannya seperti ini :
 Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Nama Produk",
      labelText: "Nama Produk",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  ),
),
tiap field pada ProductFormPage dibungkus Padding agar tidak menempel satu sama lain, menghasilkan tampilan form yang lebih rapi dan profesional.

SingleChildScrollView ini memungkinkan semua konten di dalamnya bisa discroll meski hanya ada satu anak utama, disini dipakai untuk form panjang yang berisi banyak input dan menjamin semua elemen form dapat diisi tanpa terpotong meski layar perangkat kecil atau keyboard sedang aktif.
Contoh implementasi:
body: Form(
  key: _formkey,
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // berbagai field seperti Name, Price, Description, dll
      ],
    ),
  ),
),


Listview dipakai buat menampilkan daftar elemen di satu kolom jadi ini cocok untuk menampilkan daftar produk atau menu. Pada LeftDrawer, ListView digunakan untuk menampilkan menu navigasi (Home, Tambah Produk, dll) agar bisa digulir bila jumlah item bertambah.
drawer: Drawer(
  child: ListView(
    children: [
      const DrawerHeader(...),
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Home'),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
      ),
      // dan menu lainnya...
    ],
  ),
),


 Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
 Jawab: Di file main.dart ini terdapat cara penentuan warna tema aplikasi melalui ThemeData seperti kode di bawah ini 
 return MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.blueAccent[400]),
  ),
  home: MyHomePage(),
);

disini terdapat primarySwatch: Colors.blue  untuk menetapkan warna utama aplikasi yang akan digunakan di AppBar, ikon utama, dan elemen penting lainnya.

dan secondary: Colors.blueAccent[400] yaitu warna sekunder untuk aksen dan highlight, misalnya tombol aktif, switch, atau elemen interaktif.

selain definisiin di ThemeData saya juga menerapkan warna yang konsisten di seluruh elemen UI ocontohnya di bawah ini :
appBar: AppBar(
  title: const Text(
    'Kavza Football Shop',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  backgroundColor: Colors.deepPurple, // identitas visual kuat
),

Disini AppBar diberi warna ungu tua

Selanjutnya drawer menggunakan warna biru supaya menyatu dengan warna utama apps, contoh potongan kodenya di bawah ini:
const DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.blue, // selaras dengan tema utama
  ),
  child: Column(
    children: [
      Text(
        'Kavza Football Shop',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text("Kavza — Gear up like a Champion!",
          style: TextStyle(color: Colors.white)),
    ],
  ),
),


Selanjutya tombol save memakai warna indigo  sehingga serasi dengan AppBar dan Drawer
ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.indigo),
  ),
  onPressed: () { ... },
  child: const Text("Save", style: TextStyle(color: Colors.white)),
),



 Melakukan add, commit, dan push ke GitHub.
