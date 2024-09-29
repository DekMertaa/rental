class RentalPlace {
  String name;
  String location;
  String description;
  String openDays;
  String rentalPrice;
  String imageAsset;
  
 
  RentalPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.rentalPrice,
    required this.imageAsset,
    
  });
}
 
var rentalPlaceList = [
  RentalPlace(
    name: 'Yamaha Nmax',
    location: 'Kuta',
    description:
        'Nmax menjadi salah satu motor favorit untuk melakukan perjalanan jarak jauh keliling pulau, dengan ukuran mesin 155cc mudah digunakan di tanjakan. Selain itu juga terdapat sandaran kaki saat berkendara sehingga pengendara dapat meregangkan kaki saat mengendarainya.',
    openDays: 'Open Everyday',
    rentalPrice: 'Rp 90000/hari',
    imageAsset: 'images/nmax-hijau.png',
    
  ),
  
  RentalPlace(
    name: 'Honda Vario',
    location: 'Kuta',
    description:
        'Salah satu motor reguler di Indonesia yang dirancang untuk lalu lintas perkotaan, mudah dikendalikan, dengan lampu depan LED, desain modern dan terlihat sporty. Tenaga yang cukup bagus, ukuran normal untuk berkeliling kota atau perjalanan lebih lama ke daerah lain.',
    openDays: 'Open Everyday',
    rentalPrice: 'Rp 50000/hari',
    imageAsset: 'images/Vario-blue.png',
    
  ),

    RentalPlace(
    name: 'Yamaha Fazzio',
    location: 'Kuta',
    description:
        'Skuter futuristik besutan Yamaha. Sepeda motor ini memiliki desain yang menarik, tanpa kunci, tempat penyimpanan yang luas di bawah jok dan juga memiliki colokan listrik untuk mengisi daya ponsel Anda! Fazzio juga memiliki mesin 125 yang memiliki tenaga yang baik untuk berkendara keliling kota atau bahkan jarak jauh.',
    openDays: 'Open Everyday',
    rentalPrice: 'Rp 80000/hari',
    imageAsset: 'images/Fazzio-Neo.png',
    
  ),

    RentalPlace(
    name: 'Honda Beat',
    location: 'Kuta',
    description:
        'Honda Beat adalah sepeda motor skuter matic yang diproduksi oleh perusahaan otomotif Jepang, Honda. Motor ini pertama kali diperkenalkan pada tahun 2007 dan menjadi salah satu model populer di segmen skuter matic di pasar Asia, termasuk Indonesia.',
    openDays: 'Open Everyday',
    rentalPrice: 'Rp 50000/hari',
    imageAsset: 'images/Honda-Beat.png',
    
  ),

    RentalPlace(
    name: 'Honda Scoopy',
    location: 'Kuta',
    description:
        'Ini merupakan salah satu skutik yang modis, tenaga 110cc cukup baik karena tidak terlalu kuat, genggaman dan tempat duduk yang nyaman. Favorit gadis. Sangat cocok digunakan untuk berkendara santai keliling kota namun tidak terlalu direkomendasikan untuk perjalanan jarak jauh. Cocok untuk pendatang baru (dengan pengalaman minimal).',
    openDays: 'Open Everyday',
    rentalPrice: 'Rp 65000/hari',
    imageAsset: 'images/Honda-Scoopy.png',
    
  ),

      RentalPlace(
    name: 'Honda CB150R',
    location: 'Kuta',
    description:
        'Sepeda motor jalanan telanjang dari Honda, desain sporty dengan mesin 150cc biasa digunakan untuk berkendara keliling kota dan lalu lintas. Sepeda motor pilihan yang mudah dan praktis, ramping dan bagus untuk 2 orang.',
    openDays: 'Open Everyday',
    rentalPrice: 'Rp 90000/hari',
    imageAsset: 'images/hondaCB.png',
    
  ),
];