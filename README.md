# 🤖 EV-ryday 🤖

Selamat datang ke repositori kelompok D11, yaitu aplikasi yang bernama EV-ryday!

> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester (PAS)
> pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang
> diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia
> pada Semester Gasal, Tahun Ajaran 2022/2023.

[![Staging](https://github.com/PBP-D11/proyek-akhir-semester/actions/workflows/staging.yml/badge.svg)](https://github.com/PBP-D11/proyek-akhir-semester/actions/workflows/staging.yml)
[![Pre-Release](https://github.com/PBP-D11/proyek-akhir-semester/actions/workflows/pre-release.yml/badge.svg)](https://github.com/PBP-D11/proyek-akhir-semester/actions/workflows/pre-release.yml)
[![Release](https://github.com/PBP-D11/proyek-akhir-semester/actions/workflows/release.yml/badge.svg)](https://github.com/PBP-D11/proyek-akhir-semester/actions/workflows/release.yml)
[![AppCenter Build Status](https://build.appcenter.ms/v0.1/apps/c1c2d3f3-a0b4-4138-aa3f-f39203c8d91e/branches/main/badge)](https://appcenter.ms)

## 🧑🏻‍💻 Pengembang Aplikasi : Kelompok - D11👩🏻‍💻

- [Muhammad Hafizha Dhiyaulhaq (Hafizh)](https://github.com/hafizhdh) (2106750723)
- [Fernando Nathaniel Sutanto (Nando)](https://github.com/nandonathaniel) (2106629995)
- [Nadhif Rahman Alfan (Nadhif)](https://github.com/nadhifralfan) (2106751783)
- [Michael Baptiswa Marully Pangaribuan (Michael)](https://github.com//Whosmichael) (2106752054)
- [Fitria Dwi Cahya (Fitria)](https://github.com/fitriadc) (2106751410)
- [Moreno Rassya Wibisana (Moreno)](https://github.com/morenoraw) (2106752003)

### Tujuan dan Manfaat

Aplikasi EV-ryday memiliki tujuan yakni menjadi sarana masyarakat untuk beralih kepada moda transportasi dengan sumber daya energi yang berkelanjutan dan lebih terbarukan pada masa yang akan datang.

Manfaat dari aplikasi EV-ryday adalah sebagai berikut:

1. Membantu pemilik kendaraan listrik lebih mudah dalam melakukan hal-hal yang berhubungan dengan pemeliharaan dan perawatan.
2. Memberikan wawasan kepada masyarakat yang masih belum atau ragu-ragu mengenai pemeliharaan kendaraan listrik tersebut.
3. Menjadikan aplikasi EV-ryday untuk menjadi wadah bertukar informasi mengenai kendaraan listrik dari segi kebutuhan hingga jasa pemeliharaan.

## 👩🏻‍💻 Persona 👩🏻‍💻

1. Bukan pengguna mobil listrik

- Goals :
  1. Mencari informasi seputar kendaraan listrik
  2. Bertanya seputar kendaraan listrik pada forum yang tersedia
  3. Mencari mobill listrik impian
- Permasalahan :
  1. Ingin membeli mobil listrik tetapi masih awam mengenai mobil listrik
  2. Bingung untuk bertanya seputar mobil listrik

2. Pengguna Baru mobil listrik

- Goals :
  1. Mencari informasi mengenai tips merawat mobil listrik
  2. Mencari informasi mengenai charging station di sekitar tempat tinggalnya
  3. Bergabung dengan komunitas mobil listrik untuk menambah relasi dan informasi
- Permasalahan :
  1. Baru membeli mobil listrik dan tidak mengerti cara merawat mobil listrik dengan baik
  2. Belum mempunyai home charging dan harus mencari charging station yang paling dekat dengan rumahnya
  3. Tidak memiliki relasi sesama pengguna mobil listrik

3. Pengguna Antusias Mobil Listrik

- Goals :
  1. Membantu pengguna yang masih baru dalam dunia mobil listrik dengan aktif menjawab pada forum
  2. Menambahkan charging station yang belum tercover oleh website
- Permasalahan :
  1. Mencari tempat untuk sharing seputar mobil listrik
  2. Menemukan charging station baru dan ingin sharing kepada komunitas

## 📝 Modul dan Pembagiannya 📝

| No  | Modul         | Deskripsi                                                                              | PJ Modul |
| --- | ------------- | -------------------------------------------------------------------------------------- | -------- |
| 1   | User          | Mengisi dan update profile                                                             | Nadhif   |
|     |               | Autentikasi (login, logout user)                                                       |          |
|     |               | Mapping models, views, dan integrasi                                                   |          |
| 2   | Find Charge   | Ada list untuk tempat mengecas mobil listrik                                           | Hafizh   |
|     |               | Formulir untuk melapor adanya tempat pengecasan                                        |          |
|     |               | History bila pernah mengecas di tempat yang telah digunakan                            |          |
| 3   | EVorums       | Ada dasbor seperti forum diskusi SCELE                                                 | Michael  |
|     |               | User bisa bertanya, menjawab, atau menghapus keduanya                                  |          |
| 4   | EVices        | Terdapat informasi mengenai tempat servis mobil listrik terdekat                       | Nando    |
|     | (EV Services) | User bisa mendapatkan kontak lengkap mengenai tempat servis tersebut                   |          |
| 5   | EVishlist     | Catalog mobil elektronik untuk mengenal pengguna mengenai mobil listrik                | Fitria   |
|     | (EV Wishlist) | User dapat menandai mobil yang disuka untuk disimpan sebagai wishlist                  |          |
| 6   | EV News       | User dapat melihat news sekitar EV, dan bisa filtering sesuai source news yang dilihat | Moreno   |

## Alur Pengintegrasian Web Service

Semua bagian dari aplikasi dalam module yang sebelumnya menggunakan form atau ajax akan menggunakan http request pada flutter.

Mendapatkan data dari server ev-ryday di heroku akan menggunakan bantuan library http. Idealnya semua akan dibuat class yang akan mengatasi pemanggilan Http request ke server. Class tersebut sekaligus mengatasi permasalahan csrf token dan session cookie dari pengguna.

Untuk mendapatkan csrf token akan diberikan request yerlebih dahulu ke server, kemudian server akan mengembalikan csrf token. Jika csrf token kadarluarsa, maka akan dilakukan request ulang ke server. Jika session kadarluarsa, maka pengguna wajib akan dialihkan untuk login ulang. Baik csrf token dan session cookie akan disimpan ke local storage dari aplikasi.

API dari semua endpoint disimpan sebagai konstanta untuk meningkatkan kerapian kode. Sehingga akan lebih mudah untuk dilakukan development yang lebih lanjut.
