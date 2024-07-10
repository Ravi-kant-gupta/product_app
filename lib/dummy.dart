
  // ------------- Controller part -------------------------------
  
// RxList imagesList = [].obs;
  // RxList idList = [].obs;
  // Map<String, dynamic> a = {};

  // createCollection() async {
  //   CollectionReference users = FirebaseFirestore.instance.collection('image');
  //   String id = "";
  //   var uuid = Uuid();
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   users.add({'id': uuid.v4(), 'image': imagesList.value}).then((value) {
  //     id = value.id;
  //     print("User Added+++++++++++++++ ");
  //     prefs.setString('collection_id', id);
  //   }).catchError((error) {
  //     print("Failed to add user: $error");
  //   });
  // }

  // setData(String collection) async {
  //   try {
  //     CollectionReference users =
  //         FirebaseFirestore.instance.collection('image');
  //     users.doc(collection).set({
  //       // 'id': idList[idList.length - 1],
  //       'image': imagesList.value
  //     }).then((value) {
  //       var x = value;
  //       // a[idList[idList.length - 1]] = x;
  //       print("User Added+++++++++++++++ ");
  //     }).catchError((error) {
  //       print("Failed to add user: $error");
  //     });
  //   } catch (e) {
  //     print("---${e}");
  //   }
  // }

  // updateData(String id) async {
  //   try {
  //     CollectionReference users =
  //         FirebaseFirestore.instance.collection('image');

  //     users.doc(id).update({
  //       'image': imagesList.value,
  //     }).then((value) {
  //       print("User Updated");
  //     }).catchError((error) {
  //       print("Failed to update user: $error");
  //     });
  //   } catch (e) {
  //     print("---${e}");
  //   }
  // }

  // getData(String id) async {
  //   try {
  //     DocumentReference users =
  //         FirebaseFirestore.instance.collection('image').doc(id);
  //     DocumentSnapshot querySnapshot = await users.get();
  //     imagesList.value = [];
  //     if (querySnapshot.exists) {
  //       Map<String, dynamic>? data =
  //           querySnapshot.data() as Map<String, dynamic>?;

  //       print('Document ID: $id');
  //       if (data != null) {
  //         Future.delayed(Duration(seconds: 2), () {
  //           imagesList.value = [...data['image']];
  //         });
  //         print('Document Data: $data');
  //       } else {
  //         print('Document data is null');
  //       }
  //     } else {
  //       print('No document found with the specified ID');
  //     }
  //     print(imagesList);
  //   } catch (e) {
  //     print("ERROR-- $e");
  //   }
  // }




// ----------------------- App bar Action -------------------------
// actions: [
//             ElevatedButton(
//                 onPressed: () async {
//                   await contro.createCollection();
//                 },
//                 child: Text('create')),
//             IconButton(
//                 onPressed: () async {
//                   final SharedPreferences prefs =
//                       await SharedPreferences.getInstance();
//                   String id = prefs.getString('collection_id')!;
//                   // await contro.setData(id);
//                   await contro.updateData(id);
//                 },
//                 icon: Icon(Icons.ads_click)),
//             IconButton(
//                 onPressed: () async {
//                   // await contro.updateData(0);
//                   final SharedPreferences prefs =
//                       await SharedPreferences.getInstance();
//                   String id = prefs.getString('collection_id') ?? "";
//                   await contro.getData(id);
//                 },
//                 icon: Icon(Icons.update))
//           ],
        
// ---------------- body part --------------------------------------

// Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () async {
//                   try {
//                     var picker = ImagePicker();
//                     var x = await picker.pickImage(source: ImageSource.camera);
//                     if (x != null) {
//                       // List<int> imageBytes = await x.readAsBytes();
//                       // List<int> imageBytes = widget.fileData.readAsBytesSync();
//                       // String base64Image = base64Encode(imageBytes);
//                       // print(base64Image);
//                       final storage = FirebaseStorage.instance;
//                       Reference ref = storage.ref().child(x.path);
//                       await ref.putFile(File(x.path));
//                       String url = await ref.getDownloadURL();
//                       contro.imagesList.add(url);
//                       print(url);
//                     }
//                     //getStorage() {
//                     // final storage = FirebaseStorage.instance;
//                     // print(storage);
//                     // Get a non-default Storage bucket
//                     // final storage = FirebaseStorage.instanceFor(bucket: "gs://my-custom-bucket");
//                     //}
//                   } catch (e) {
//                     print("ERROR ---- ${e}");
//                   }
//                 },
//                 child: Text("kjnv")),
//             Obx(() {
//               return Expanded(
//                   child: GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2),
//                       itemCount: contro.imagesList.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           margin: EdgeInsets.all(8),
//                           child: Image.network(
//                               fit: BoxFit.contain, contro.imagesList[index]),
//                         );
//                       }));
//             })
//           ],
//         ))