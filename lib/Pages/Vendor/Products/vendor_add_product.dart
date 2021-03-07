// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fyp_smart_shopping/components/constants.dart';
// import 'package:fyp_smart_shopping/components/round_button.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:fyp_smart_shopping/components/text_box.dart';
// import 'dart:io';
//
// class VendorAddProduct extends StatefulWidget {
//   static const String id = 'vendor_add_product';
//   @override
//   _VendorAddProductState createState() => _VendorAddProductState();
// }
//
// class _VendorAddProductState extends State<VendorAddProduct> {
//   File _img;
//
//   Future productImage() async {
//     var img = await ImagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _img = img;
//     });
//   }
//
//   String newProductCategory;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrangeAccent,
//         title: Text(
//           'Add Product',
//           style: kAppBarTitleTextStyle,
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
//         child: ListView(
//           children: <Widget>[
//             Text(
//               'Title',
//               style: kFormTextStyle,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextBox(hnt: 'Enter product name'),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//               'Description',
//               style: kFormTextStyle,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextBox(hnt: 'Description of the product'),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               children: <Widget>[
//                 Text(
//                   'Price',
//                   style: kFormTextStyle,
//                 ),
//                 SizedBox(
//                   width: 150,
//                 ),
//                 Text(
//                   'Quantity',
//                   style: kFormTextStyle,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextBox(hnt: 'Price per item'),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                   child: TextBox(hnt: 'Quantity'),
//                 )
//               ],
//             ),
//             //Ahmar, apply a check on this textfield's data (acceptDigitsOnly)
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               children: <Widget>[
//                 Text(
//                   'Image',
//                   style: kFormTextStyle,
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
//                     child: Material(
//                       color: Colors.deepOrangeAccent,
//                       borderRadius: BorderRadius.circular(8.0),
//                       elevation: 5.0,
//                       child: MaterialButton(
//                         child: Text(
//                           'Upload',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                         onPressed: productImage,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             Center(
//               child: _img == null
//                   ? Text('No Image Selected')
//                   : Image.file(_img, width: 200, height: 200),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             RoundButton(
//               title: 'Save',
//               onPressed: () {
//                 print('Save data to firebase');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
