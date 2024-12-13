import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_services.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<void> getData({required String path}) async {
    await firestore.collection(path).get();
  }

  @override
  Future<void> deleteData({required String path}) async {
    await firestore.collection(path).doc().delete();
  }

  @override
  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) {
    // TODO: implement setData
    throw UnimplementedError();
  }

  @override
  Future<void> updateData(
      {required String path, required Map<String, dynamic> data}) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
