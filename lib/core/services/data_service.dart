abstract class DataBaseServices {



  Future<bool> checkIfDataExists({required String path, required String docuementId});
    Future<dynamic> getData({
    required String path,
     String? docuementId,
     Map<String, dynamic>? query,
  });
    Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
}