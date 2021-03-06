import 'dart:ui';
// class Car {
//   String brand, image, pricePerDay, year;
//
//   Car({required this.brand, required this.image, required this.pricePerDay, required this.year});
//
//   factory Car.fromJson(Map<String, dynamic> json) => Car(
//         brand: json['brand'],
//         image: json['image'],
//         pricePerDay: json['price_per_day'],
//         year: json['year'],
//       );
//
//   Map<String, dynamic> toJson() => {
//         'brand': brand,
//         'image': image,
//         'price_per_day': pricePerDay,
//         'year': year,
//       };
// }
//
// List<Car> cars = [
//   Car(brand: 'Toyota Vitz', image: 'assets/images/toyota1.png', pricePerDay: '35000', year: '2009'),
//   Car(brand: 'Nissan Pathfinder', image: 'assets/images/toyota.png', pricePerDay: '70000', year: '2009'),
//   Car(brand: 'Toyota Vitz', image: 'assets/images/toyota.png', pricePerDay: '70000', year: '2009'),
//   Car(brand: 'Nissan Pathfinder', image: 'assets/images/jeep.png', pricePerDay: '35000', year: '2009'),
//   Car(brand: 'Toyota Vitz', image: 'assets/images/toyota1.png', pricePerDay: '35000', year: '2009'),
// ];
// class CarModel{
//   final String brand, image, pricePerDay, year;
//
//   CarModel(this.brand, this.image, this.pricePerDay, this.year);
// }





class Category {
  String? brand;
  String? imgName;
  Color? price;
  String? year;


  Category(
      {
        this.brand,
        this.imgName,
        this.price,
        this.year,

      }
      );

  factory Category.fromJson(Map<String, dynamic> json) {

    return Category(
        brand: json['brand'],
        imgName: json['icon'],
        price: json['name'],
        year: json['imgName'],

    );
  }
}



