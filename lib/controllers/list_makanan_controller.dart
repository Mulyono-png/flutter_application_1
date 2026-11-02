import 'package:flutter_application_1/models/makanan_model.dart';
import 'package:get/get.dart';

class ListMakananController extends GetxController {
  final List<MakananModel> dataMakanan = [
    MakananModel(
      namaMakanan: "Soto Ayam",
      harga: "10.000",
      rating: "4.8",
      deskripsi: "Soto ayam hangat dengan kuah kaldu gurih yang dimasak bersama rempah pilihan. Disajikan dengan suwiran ayam, bihun, kol, dan taburan daun bawang untuk rasa yang kaya dan menyegarkan.",
      gambar: "https://thumb.wikimedia.org/wikipedia/commons/thumb/a/ac/Soto_Ayam_-_Rest_Area_KM_726B.jpg/960px-Soto_Ayam_-_Rest_Area_KM_726B.jpg",
      review: "Rasa kuahnya enak dan bikin nagih.",
    ),
    MakananModel(
      namaMakanan: "Ayam Goreng",
      harga: "12.000",
      rating: "4.7",
      deskripsi: "Potongan ayam dibumbui hingga meresap, lalu digoreng sampai bagian luar terasa renyah sementara bagian dalam tetap juicy. Nikmat disantap bersama nasi hangat dan sambal.",
      gambar: "https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9d/Ayam_goreng_kalasan.JPG/960px-Ayam_goreng_kalasan.JPG",
      review: "Crispy dan gurih, cocok untuk lauk sehari-hari.",
    ),
    MakananModel(
      namaMakanan: "Ayam Bakar",
      harga: "12.000",
      rating: "4.9",
      deskripsi: "Ayam berbumbu dimasak perlahan hingga empuk, kemudian dibakar sampai harum dengan lapisan bumbu kecap yang gurih-manis. Cocok dipadukan dengan nasi dan lalapan.",
      gambar: "https://thumb.wikimedia.org/wikipedia/commons/thumb/d/db/Ayam_Bakar_Bali.jpg/960px-Ayam_Bakar_Bali.jpg",
      review: "Bumbunya terasa dan teksturnya empuk.",
    ),
    MakananModel(
      namaMakanan: "Ayam Geprek",
      harga: "11.000",
      rating: "4.6",
      deskripsi: "Ayam berbalut tepung renyah yang digeprek bersama sambal bercita rasa pedas dan gurih. Tingkat pedasnya bisa disesuaikan saat memesan.",
      gambar: "https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5c/Ayam_Geprek_Uyat.jpg/960px-Ayam_Geprek_Uyat.jpg",
      review: "Pedasnya mantap dan ayamnya renyah.",
    ),
    MakananModel(
      namaMakanan: "Nasi Goreng",
      harga: "13.000",
      rating: "4.8",
      deskripsi: "Nasi yang ditumis dengan bumbu khas hingga harum, menghasilkan rasa gurih dengan sentuhan manis. Disajikan dengan telur sebagai pelengkap yang mengenyangkan.",
      gambar: "https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=800&q=85",
      review: "Rasanya enak dan porsi pas untuk makan siang.",
    ),
    MakananModel(
      namaMakanan: "Mie Ayam",
      harga: "12.000",
      rating: "4.8",
      deskripsi: "Mie kenyal disajikan dengan potongan ayam berbumbu gurih, sayuran segar, dan kuah hangat. Menu klasik yang cocok dinikmati kapan saja.",
      gambar: "https://thumb.wikimedia.org/wikipedia/commons/thumb/8/82/Mi_ayam_jamur.JPG/960px-Mi_ayam_jamur.JPG",
      review: "Mienya kenyal, ayamnya gurih, dan kuahnya hangat.",
    ),
    MakananModel(
      namaMakanan: "Nasi Padang",
      harga: "18.000",
      rating: "4.9",
      deskripsi: "Nasi putih hangat dengan lauk bercita rasa kaya rempah dan sambal khas. Paduan rasa gurih dan pedasnya membuat menu ini semakin nikmat.",
      gambar: "https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3f/Nasi_Padang_Rendang.jpg/960px-Nasi_Padang_Rendang.jpg",
      review: "Bumbunya kaya rasa dan porsinya mengenyangkan.",
    ),
    MakananModel(
      namaMakanan: "Soto Kerbau",
      harga: "15.000",
      rating: "4.7",
      deskripsi: "Soto berkuah rempah dengan irisan daging kerbau yang empuk. Disajikan hangat dengan pelengkap segar untuk rasa yang gurih dan khas.",
      gambar: "https://thumb.wikimedia.org/wikipedia/commons/thumb/1/11/Soto_Kudus_nasi.JPG/960px-Soto_Kudus_nasi.JPG",
      review: "Kuahnya gurih dan daging kerbaunya terasa empuk.",
    ),
  ];
}
