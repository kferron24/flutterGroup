import 'package:firebase_storage/firebase_storage.dart' as firbase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  final firbase_storage.FirebaseStorage storage =
      firbase_storage.FirebaseStorage.instance;

  Future<String> downloadURL(String imageName) async {
    String downloadURL = await storage.ref(imageName).getDownloadURL();
    return downloadURL;
  }
}
