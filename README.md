<h3 align="center"> Curhat.in <br> Paralel Praktikum II <br>  Kelompok 11 </h3>

## Curhat.in
**Curhat.in** merupakan aplikasi konsultasi berbasis mobile yang diperuntukkan bagi Mahasiswa/i IPB University untuk berbagi masalah mereka tentang akademik, keluarga, keuangan, hubungan asmara, dan masalah lain yang berhubungan dengan kesehatan mental. Aplikasi ini dapat menjadi wadah bagi Mahasiswa/i untuk mengetahui pentingnya menjaga kesehatan mental dan membantu dalam menangani kasus permasalahan mengenai kesehatan mental. Mahasiswa/i dapat melakukan konsultasi secara gratis bersama konselor sebaya melalui chat dari aplikasi ini. Selain penanganan aktif melalui konsultasi bersama konselor sebaya, Mahasiswa/i mampu membaca artikel terkait kesehatan mental yang relevan bagi kehidupan kesehariannya. 

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
<li>  <b> Text Editor  </b>                    : Visual Studio Code <br> </li> 
<li> <b> Operating System </b>             : Windows 10 Pro 64-bit <br> </li>
<li>  <b> Design Tools and Prototyping  </b>   : Figma dan Marvel App <br> </li>
<li> <b> Management Tools  </b>              : Trello dan Github <br> </li>
</ul>

<h3> Hardware </h3>
<ul>
<li>  <b> CPU  </b>   : Intel Core i7-4600U @2.10GHz <br> </li> 
<li>  <b> GPU  </b>    : Intel HD Graphic Family <br> </li>
<li>  <b> RAM  </b>   : 4GB DDR <br> </li>
<li>  <b> ROM  </b>   : 512Gb HDD dan 128Gb SSD <br> </li>
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
<img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/MVC.png?raw=true" width="400">
</p>
Dalam merancang dan mengembangkan aplikasi konsultasi berbasis mobile (Curhat.in), kelompok kami menggunakan design pattern MVC (Model, View, Controllers) yang mana sistem pengembangan aplikasi tersebut terdiri menjadi tiga bagian, yaitu model (database), view (tampilan antarmuka), dan yang terakhir controllers (interaksi model dan view). Sarana yang kami pakai dalam design pattern tersebut adalah Framework Flutter.
<h3> Model </h3>
<h3> View </h3>
<h3> Controllers </h3>

## Hasil dan Pembahasan
<h3> 1. Use Case Diagram </h3>
  <ul>
  <li>  <b> Artikel Psikoinfo  </b> </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Membaca%20Artikel-Page-5.png?raw=true" width="500">
  </p>
  
  <li>  <b> Konsultasi Akademik  </b> </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Konsultasi.png?raw=true" width="500">
  </p>
   
  <li>  <b> Konsultasi Kebugaran  </b> </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Kebugaran.png?raw=true" width="500">
  </p>
  
  <li>  <b> Konsultasi Finansial  </b> </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Finansial%20(1).png?raw=true" width="500">
  </p>
    
  <li>  <b> Konsultasi Keluarga  </b> </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/family%20(1).png?raw=true" width="500">
  </p>
    
  <li>  <b> Profile  </b> </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Profile.png?raw=true" width="500">
  </p>
   </ul>
<hr>
<h3> 2. Activity Diagram </h3>
 <ul>
  
   <li>  <b> CRUD Profile  </b> </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/CRUD%20Profile.png?raw=true" width="500">
  </p>
  
  <li>  <b> Membaca Artikel Psikoinfo  </b> </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Membaca%20Artikel.png?raw=true" width="500">
  </p>
  
  <li>  <b> Menulis Artikel Psikoinfo  </b> </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Menulis.png?raw=true" width="500">
  </p>
  
  <li>  <b> Konsultasi Sebaya </b> </li>
  <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Mengirim%20Pesan.png?raw=true" width="500">
  </p>
 <hr>

  <h3> 3. Class Diagram </h3>
  <hr>
  
  <h3> 4. Entity Relationship Diagram Diagram </h3>
  <hr>
  
  <h3> 5. Arsitektur Sistem </h3>
   <ul>
     <li> <b> Ringkasan </b>  : Untuk bahasa pemrograman, Tim Curhat.in menggunakan bahasa pemrograman Dart dengan framework Flutter.  </li>
     <li> <b> Masalah </b> : Masalah yang dihadapi oleh Tim Curhat.in adalah jangka waktu yang sangat terbatas, karena ini memberikan waktu 7 pertemuan selama sesi UAS untuk mengembangkan sebuah aplikasi sampai selesai. Sedangkan, untuk mengembangkan aplikasi butuh waktu yang cukup lama terutama dalam pembelajaran bahasa pemrograman yang baru, penerapan konsep OOP, dan Design Pattern. </li>
     <li> <b> Opsi  </b> : 
     <p align="center">
  <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/vs.png?raw=true" width="300"> </p> </li> 
     <li> <b> Rasional </b> : Tim Curhat.in memilih menggunakan bahasa Dart dan framework Flutter dikarenakan waktu pengembangan aplikasi yang diberikan cukup singkat dan membutuhkan tampilan antarmuka yang menarik. </li>
  <hr>
  
  <h3> 6. Fungsi Utama yang Dikembangkan </h3>
  <li> <b> Chatting dengan konselor </b>  :Sesuai dengan tujuannya, aplikasi yang kami kembangkan membantu mahasiswa yang memiliki masalah untunk dihubungkan dengan konselor sebaya yang juga berasal dari mahasiswa. Kegiatan konseling mahasiswa terjadi di dalam percakapan <i> chatting </i> Mahasiswa dapat memilih kateogri permasalahan yang dirasa sangat berat dan memilih konselor terkait permasalahan tersebut. Setelah memilih konselor mahasiswa dapat melakukan chatting dengan konselornya.</li>
  <li> <b> Membaca Artikel  </b> : Selain membantu penyelesaian permasalahan via chatting, pengguna juga dapat membaca kumpulan artikel terkait kesehatan mental yang dapat membantu mereduksi permasalahannya secara mandiri. Artikel yang terdapat di dalam aplikasi curhat.in ditulis oleh Konselor sebaya yang merupakan tempat konsultasi</li> 
     <hr>
  
  <h3> 7. Fungsi CRUD </h3>
      <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/Screen%20Shot%202021-06-07%20at%2010.48.46.png?raw=true" width="750"> </p> 
  <p> <b>Create Read Update Table:</b> Tabel terkait fitur CRUD yang dapat dilakukan oleh user dari role Konseli dan Konselor </p>
  <hr>
  
## Hasil implementasi
  <h3> 1. Screenshot Sistem </h3>
      <p float="left">
          <img src="https://raw.githubusercontent.com/rizkyabdullahf/psbo-kelompok11/main/web/unnamed-3.jpg" width="200" />
          <img src="https://raw.githubusercontent.com/rizkyabdullahf/psbo-kelompok11/main/web/unnamed-4.jpg" width="200" /> 
          <img src="https://raw.githubusercontent.com/rizkyabdullahf/psbo-kelompok11/main/web/unnamed-5.jpg" width="200" />
      </p>
  <hr>
 
     
  <h3> 2. Link aplikasi (jika sudah di deploy) </h3>
    <p align="center">
    <img src="https://github.com/rizkyabdullahf/psbo-kelompok11/blob/main/web/playstore.png?raw=true" width="900"> </p> 
     https://play.google.com/store/apps/details?id=com.curhatin.apps
     
  <hr>
  
## Saran untuk pengembangan selanjutnya
Untuk pengembangan sistem aplikasi konsultasi mobile (Curhat.in), diharapkan akan ada penambahan fitur berupa video conference untuk lebih mengenal lebih dekat secara tatap muka virtual antara Konseli dan Konselor. Selain itu, diharapkan juga akan ada penambahan fitur berupa grup atau komunitas tertentu agar masalah yang mungkin terbilang sama dapat ditampung dalam satu waktu oleh Konselor.   
  
## Developer dan Job Desc
<h3> Curhat.in </h3>
 <ul>
   <li>  <b> Abdan Syakuro (G64170101) -- Project Manager, Front End, Back End.  </b> </li>
   <li>  <b> Rizky Abdullah Falah (G64170063) -- System Analyst.  </b> </li>
   <li>  <b> Rakheda Andria Parastu  (G64180105) -- Back End.  </b> </li>
   <li>  <b> Fadil Risdian Ansori (G64180111) -- Front End.  </b> </li>
  </ul>
     
 ## Testing (Test Cases)
     
