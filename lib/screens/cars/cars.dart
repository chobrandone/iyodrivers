//
// import 'package:flutter/cupertino.dart';
//
// import '../../models/car.dart';
//
// class Cars extends StatelessWidget {
//   const Cars({Key? key}) : super(key: key);
//
//   @override
//
//   Widget build(BuildContext context) {
//
//     List<Category> categories = catService.getCategories();
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 10, bottom: 10),
//             child: Text('Seleccione una categoría:',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.black)
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: categories.length,
//               itemBuilder: (BuildContext ctx, int index) {
//                 return CategoryCard(
//                     category: categories[index],
//                     onCardClick: () {
//                       catSelection.selectedCategory = categories[index];
//                       Utils.mainAppNav.currentState!.pushNamed('/selectedcategorypage');
//                     }
//                 );
//               },
//             ),
//           )
//         ]
//     );
//   }
// }
