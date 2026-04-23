# Hiking Gear App

Aplikasi mobile berbasis Flutter untuk simulasi e-commerce perlengkapan hiking.  
Aplikasi ini menggunakan Firebase sebagai backend dan Provider sebagai state management.

---

## Fitur Utama

- Register dan verifikasi email (Firebase Authentication)
- Login user
- Menampilkan katalog produk (Cloud Firestore)
- Cart (keranjang belanja)
- Checkout
- Penyimpanan cart secara lokal (SharedPreferences)
- Push notification (Firebase Messaging)

---

## Arsitektur Aplikasi

Aplikasi ini menggunakan arsitektur sederhana dengan tiga layer utama:

### 1. Presentation Layer
Berisi tampilan UI:
- HomeScreen
- CartScreen
- CheckoutScreen
- Login dan Register

### 2. State Management
Menggunakan Provider:
- Mengelola data cart
- Menghubungkan state dengan UI secara real-time

### 3. Data Layer
- Firebase Authentication untuk autentikasi
- Cloud Firestore untuk data produk
- SharedPreferences untuk penyimpanan lokal cart
- Firebase Messaging untuk notifikasi

---

## State Flow

1. User melakukan login atau register
2. Firebase Authentication menghasilkan token autentikasi
3. Data produk diambil dari Firestore
4. User menambahkan produk ke cart
5. Data cart disimpan ke:
   - Provider (state di memory)
   - SharedPreferences (penyimpanan lokal)
6. Saat aplikasi dibuka kembali, cart akan di-load dari local storage
7. User melakukan checkout, lalu cart dikosongkan

---

## JWT dan Authentication

Aplikasi ini menggunakan Firebase Authentication yang secara internal menggunakan JSON Web Token (JWT).

Alur autentikasi:
1. User melakukan login atau register
2. Firebase mengembalikan ID Token (JWT)
3. Token ini digunakan untuk:
   - Mengidentifikasi user
   - Mengakses layanan Firebase seperti Firestore

Karakteristik JWT:
- Bersifat stateless (tidak membutuhkan session di server)
- Aman karena menggunakan signature
- Digunakan untuk komunikasi antara client dan server

---

## API Integration

Aplikasi menggunakan Firebase sebagai backend API:

### Firestore
Digunakan untuk menyimpan dan mengambil data produk secara real-time.

Contoh penggunaan:
```dart
FirebaseFirestore.instance.collection('products').snapshots();
```

## Demo

untuk detail bisa cek youtube aku: 
https://www.youtube.com/watch?v=LINK_VIDEO_KAMU
