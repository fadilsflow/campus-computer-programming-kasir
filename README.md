---
title: kasir Desktop - Java
date: 
tags:
  - general
  - notes
notes list:
  - "[[$General Notes List]]"
  - "[[$List All Notes]]"
---
# kasir Desktop - Java
Aplikasi ini dibuat untuk tugas akhir mata Kuliah Pemrograman Komputer. Mempunyai 3 Role atau halaman user yaitu = [ admin, kasir, owner ]. Setiap Role memiliki fitur atau hak akses yang berbeda beda.

## Fitur Per Role
- Admin
	- Akses penuh terhadap data pengguna/user:
		- Menambahkan data pengguna/user
		- Mengubah data pengguna/user
		- Menghapus data pengguna/user
		- Melihat data pengguna/user
	- Akses penuh terhadap data Produk
		- Menambahkan data Produk
		- Mengubah data Produk
		- Menghapus data produk
		- Melihat data Produk
- Kasir
	- Memproses Pembelian pelanggan
		- Menginput produk yang dibeli
		- Menginput uang pembayaran
		- Melihat total harga
		- Melihat uang kembali
		- Melakukan Chekout
		- Melihat daftar, kode, stok produk yang tersedia
	- Akses terhadap riwayat keuangan
		- Terdapat 1 tabel yang berisi no, tanggal, dan uang masuk
	- Akses terhadap riwayat transaksi
		- Terdapat 1 tabe yang berisi no, tanggal, id produk, dan jumlah terjual
- Owner
	- Melihat jumlah produk yang terjual dengan custom periode menggunakan calendar
	- Melihat Produk terlaris  dengan custom periode menggunakan calendar dan akan ditampilkan melalui tabel yang berisi: nomor, jumlah barang, dan nama barang
	- Melihat jumlah pendapatan dengan custom periode menggunakan calendar
	- Melihat grafik penjualan dengan custom periode menggunakan calendar
	- Melihat rank/top kasir dengan custom periode menggunakan calendar dan akan ditampilkan di melalui tabel yang berisi: nomor, nama, jumlah transaksi, dan jumlah barang yang dijual
## Installasi
#### Prasyarat

1. Java Development Kit (JDK) versi 23
2. MySQL Database
#### Langkah Instalasi
##### Windows
1. Dowload the exe file: [soon]
2. Klik dan install
##### From Skratch
1. Clone the repository
```bash
	git clone https://github.com/fadilsflow/campus-computer-programming-kasir
	cd campus-computer-programming-kasir
```
2. soon hehe
