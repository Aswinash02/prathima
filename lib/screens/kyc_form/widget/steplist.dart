// import 'dart:io';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:onnwheels/controllers/verification_controller.dart';
// import 'package:onnwheels/customs/toastcomponent.dart';
// import 'package:onnwheels/mytheme.dart';
// import 'package:onnwheels/repositories/verification_repositories.dart';
// import 'package:prathima_loan_app/controllers/kyc_controller.dart';
// import 'package:toast/toast.dart';
//
// class StepList {
//   static List<Step> stepList(KycController kycController) {
//     return [
//       Step(
//         state: kycController.activeCurrentStep <= 0
//             ? StepState.editing
//             : StepState.complete,
//         isActive: kycController.activeCurrentStep >= 0,
//         title: const Text(
//           'Personal Details',
//           style: TextStyle(fontSize: 10),
//         ),
//         content: Container(
//           child: Column(
//             children: [
//               TextField(
//                 controller: kycController.name,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Full Name',
//                 ),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               // TextField(
//               //   controller: kycController.phone,
//               //   decoration: const InputDecoration(
//               //     border: OutlineInputBorder(),
//               //     labelText: 'phone',
//               //   ),
//               // ),
//               // const SizedBox(
//               //   height: 8,
//               // ),
//               // TextField(
//               //   controller: kycController.city,
//               //   obscureText: true,
//               //   decoration: const InputDecoration(
//               //     border: OutlineInputBorder(),
//               //     labelText: 'City',
//               //   ),
//               // ),
//               // const SizedBox(
//               //   height: 8,
//               // ),
//               // TextField(
//               //   controller: kycController.address,
//               //   decoration: const InputDecoration(
//               //     border: OutlineInputBorder(),
//               //     labelText: 'Full House Address',
//               //   ),
//               // ),
//               // const SizedBox(
//               //   height: 8,
//               // ),
//               // TextField(
//               //   controller: kycController.pincode,
//               //   decoration: const InputDecoration(
//               //     border: OutlineInputBorder(),
//               //     labelText: 'Pin Code',
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//       Step(
//         state: kycController.activeCurrentStep.value <= 1
//             ? StepState.editing
//             : StepState.complete,
//         isActive: kycController.activeCurrentStep.value >= 1,
//         title: const Text(
//           'Verification',
//           style: TextStyle(fontSize: 10),
//         ),
//         content: Container(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 8,
//               ),
//               TextField(
//                 controller: kycController.aadharData,
//                 decoration: const InputDecoration(
//                   // border: OutlineInputBorder(),
//                   labelText: 'Aadhar Number',
//                 ),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               InkWell(
//                 child: Container(
//                   height: 40,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: MyTheme.black,
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Verify",
//                       style: TextStyle(color: MyTheme.white),
//                     ),
//                   ),
//                 ),
//                 onTap: () {},
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               TextField(
//                 controller: kycController.panData,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Pan Number',
//                     enabled: kycController.panSuccess.value == false
//                         ? true
//                         : false),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               InkWell(
//                 child: Obx(
//                       () => Container(
//                     height: 40,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: kycController.panSuccess.value != true
//                           ? MyTheme.black
//                           : MyTheme.green,
//                     ),
//                     child: Center(
//                       child: Text(
//                         kycController.panSuccess.value != true
//                             ? "Verify"
//                             : "Verified",
//                         style: TextStyle(color: MyTheme.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 onTap: () async {
//                   if (kycController.panSuccess.value != true) {
//                     var panVerifyResponse = await VerificationRepository()
//                         .panVerificationPost(
//                         panNumber: kycController.panData.text);
//                     if (panVerifyResponse.status == 0) {
//                       kycController.panSuccess.value = true;
//                       print("success");
//                       ToastComponent.showDialog(
//                           panVerifyResponse.message!.toString(),
//                           gravity: Toast.center,
//                           duration: Toast.lengthLong);
//                     } else {
//                       print("failed");
//                       ToastComponent.showDialog(
//                           panVerifyResponse.message!.toString(),
//                           gravity: Toast.center,
//                           duration: Toast.lengthLong);
//                     }
//                   }
//                 },
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               Row(
//                 children: [
//                   Text(
//                     "Licence Upload",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         InkWell(
//                           child: DottedBorder(
//                             color: MyTheme.blue,
//                             strokeWidth: 1,
//                             child: Container(
//                               height: 140,
//                               width: 140,
//                               color: MyTheme.white,
//                               child: kycController
//                                   .selectedImagePathFront.value !=
//                                   ''
//                                   ? Obx(
//                                     () => Image.file(
//                                     File(kycController
//                                         .selectedImagePathFront.value),
//                                     fit: BoxFit.fill),
//                               )
//                                   : Center(child: Icon(Icons.cloud_download)),
//                             ),
//                           ),
//                           onTap: () async {
//                             kycController.isFront = true;
//                             await kycController
//                                 .chooseAndUploadFile(Get.context!);
//                             // _pickImage(ImageSource.camera);
//                           },
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: Text("Front"),
//                         )
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         InkWell(
//                           child: DottedBorder(
//                             color: MyTheme.blue,
//                             strokeWidth: 1,
//                             child: Container(
//                               height: 140,
//                               width: 140,
//                               color: MyTheme.white,
//                               child: kycController
//                                   .selectedImagePathBack.value !=
//                                   ''
//                                   ? Obx(
//                                     () => Image.file(
//                                     File(kycController
//                                         .selectedImagePathBack.value),
//                                     fit: BoxFit.fill),
//                               )
//                                   : Center(child: Icon(Icons.cloud_download)),
//                             ),
//                           ),
//                           onTap: () async {
//                             kycController.isFront = false;
//                             await kycController
//                                 .chooseAndUploadFile(Get.context!);
//                           },
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: Text("Back"),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       Step(
//           state: StepState.complete,
//           isActive: kycController.activeCurrentStep.value >= 2,
//           title: const Text(
//             'Confirm',
//             style: TextStyle(fontSize: 10),
//           ),
//           content: Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text('Name: ${kycController.name.text}'),
//                   Text("Aadhar: ${kycController.aadharData.text}"),
//                   Text("Pan: ${kycController.panData.text}")
//                   // Text('Phone: ${kycController.phone.text}'),
//                   // Text('City: ${kycController.city.text}'),
//                   // Text('Address : ${kycController.address.text}'),
//                   // Text('PinCode : ${kycController.pincode.text}'),
//                 ],
//               )))
//     ];
//   }
// }
