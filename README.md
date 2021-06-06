<h3 align="center"> IPB Konseling <br> Paralel Praktikum II <br>  Kelompok 11 </h3>

## IPB Konseling 
**IPB Konseling** merupakan aplikasi konsultasi berbasis mobile yang diperuntukkan bagi Mahasiswa/i IPB University untuk berbagi masalah mereka tentang akademik, keluarga, keuangan, hubungan asmara, dan masalah lain yang berhubungan dengan kesehatan mental. Aplikasi ini dapat menjadi wadah bagi Mahasiswa/i untuk mengetahui pentingnya menjaga kesehatan mental dan membantu dalam menangani kasus permasalahan mengenai kesehatan mental. Mahasiswa/i dapat melakukan konsultasi secara gratis bersama konselor sebaya melalui chat dari aplikasi ini. Selain penanganan aktif melalui konsultasi bersama konselor sebaya, Mahasiswa/i mampu membaca artikel terkait kesehatan mental yang relevan bagi kehidupan kesehariannya. 

## User Analysis
<h3> User Story </h3>
<ul>
<li> <b> Radha Syifa Salsabila (19 tahun) </b> </li> 
Sebagai seorang Mahasiswi IPB University, saya membutuhkan artikel-artikel terkait informasi kesehatan mental yang relevan agar saya dapat mempelajari pentingnya menjaga kesehatan mental dengan baik dan teratur. 
</ul>
<ul>
<li> <b> Rasya Ahmad Kurnia (21 tahun) </b> </li>
Sebagai seorang Mahasiswa IPB University, saya membutuhkan konsultasi dengan teman sebaya yang paham terkait permasalahan Mahasiswa pada umumnya untuk bisa membantu saya menangani permasalahan kesehatan mental yang saya rasakan.
</ul>
<ul>
<li> <b> Ardella Maharani (22 tahun) </b> </li> 
Sebagai seorang Konselor, saya ingin membantu Mahasiswa/i yang memiliki permasalahan akademik, keluarga, atau kesehatan mental melalui fitur chat suatu aplikasi konseling di smartphone untuk bisa meringankan permasalahan mereka agar tidak terkena stress tingkat berat.  
</ul>

## Spesifikasi Teknis Lingkungan Pengembangan
<h3> Software </h3>
<ul>
<li> Text Editor                    : Visual Studio Code <br> </li> 
<li> Operating System               : Windows 10 Pro 64-bit <br> </li>
<li> Design Tools and Prototyping   : Figma dan Marvel App <br> </li>
<li> Management Tools               : Trello dan Github <br> </li>
</ul>

<h3> Hardware </h3>
<ul>
<li> CPU    : Intel Core i7-4600U @2.10GHz <br> </li> 
<li> GPU    : Intel HD Graphic Family <br> </li>
<li> RAM    : 4GB DDR <br> </li>
<li> ROM    : 512Gb HDD dan 128Gb SSD <br> </li>
</ul>

<h3> Tech Stack </h3>
<ul>
<li> HTML, CSS, Javascript    : (Programming Languange) <br> </li> 
<li> Flutter                  : (Framework) <br> </li>
<li> Firebase Authentication  : (Role based User Auth)</li>
<li> Cloud Firestore          : (NoSQL Database) </li>
<li> Firebase Storage         : (Image Database) </li>
<li> Firebase Messaging       : (Push Notifications) </li>
<li> Provider                 : (State Management) </li>
</ul>

## Konsep OOP yang digunakan
<h3> 1. Kelas Abstrak </h3>
<ul>
  <li> Kelas merupakan deskripsi abstrak suatu informasi dan tingkah laku dari sekumpulan data serta merupakan tipe data bagi objek yang mengenkapsulasi data dan operasi pada data dalam suatu unit tunggal. </li>
  <li> Kelas mendefinisikan suatu struktur yang terdiri dari data field, prosedur atau fungsi, dan property. </li>
  <li> Kelas dapat memberikan ilustrasi sebagai suatu cetak biru atau prototipe yang digunakan untuk merancang dan membuat objek. </li>
</ul>

<h3> 2. Enkapsulasi </h3>
  <ul>
    <li> Enkapsulasi menekankan pada antarmuka suatu kelas dan menekankan bagaimana menggunakan objek kelas tertentu. </li>
    <li> Proses enkapsulasi memudahkan kami untuk memakai sebuah objek dari suatu kelas karena kami tidak perlu mengetahui objek kelas lain secara rinci. </li>
    <li> Kombinasi data dan fungsionalitas dalam sebuah unit tunggal diperuntukan sebagai bentuk untuk melakukan hidden informasi yang bersifat detail. </li>
  </ul>

<h3> 3. Pewarisan </h3>
<ul>
    <li> Dengan konsep pewarisan, kami dapat memakai kode yang telah ditulis pada super class secara berulang kali pada kelas-kelas turunannya tanpa harus menulis ulang semua kode kode tersebut. </li>
  <li> Kami dapat mendefinisikan suatu kelas baru dengan mewarisi sifat dari kelas lain yang telah ada. </li>
  <li> Penurunan sifat tersebut dapat dilakukan secara bertingkat-tingkat, sehingga semakin ke bawah kelas tersebut menjadi lebih spefisik. </li>
  </ul>
  
## Tipe desain pengembangan yang digunakan (Pattern - Anti Pattern)
<p align="center">
<img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/MVC.png?raw=true" width="600">
</p>
Dalam merancang dan mengembangkan aplikasi konsultasi berbasis mobile (IPB Konseling), kelompok kami menggunakan design pattern MVC (Model, View, Controllers) yang mana sistem pengembangan aplikasi tersebut terdiri menjadi tiga bagian, yaitu model (database), view (tampilan antarmuka), dan yang terakhir controllers (interaksi model dan view). Sarana yang kami pakai dalam design pattern tersebut adalah Framework Flutter.
<h3> Model </h3>
<h3> View </h3>
<h3> Controllers </h3>

## Hasil dan Pembahasan
<h3> 1. Use Case Diagram </h3>
  <ul>
  <li> Artikel Psikoinfo </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Membaca%20Artikel-Page-5.png?raw=true" width="600">
  </p>
  <br>
  <li> Konsultasi Akademik </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Konsultasi.png?raw=true" width="600">
  </p>
   <br>
  <li> *Konsultasi Kebugaran* </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Kebugaran.png?raw=true" width="600">
  </p>
    </ul>
    <br>
  <li> Konsultasi Finansial </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Finansial%20(1).png?raw=true" width="600">
  </p>
    </ul>
    <br>
  <li> Konsultasi Keluarga </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/family%20(1).png?raw=true" width="600">
  </p>
    </ul>
     <br>
  <li> Profile </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Profile.png?raw=true" width="600">
  </p>
    </ul>
    
    
 

This app is created using the MVC (Model View Controller) Design Pattern

### Features
   - Role based user authentication (consultant and student)
   - Real-time user chat (between consultant and student) 
   - Online/offline user presence
   - CRUD psychological articles (Psikoinfo) 
   - CRUD user profile


- Provider (State Management)
