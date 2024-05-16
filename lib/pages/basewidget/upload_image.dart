import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class ImageUploader {
  // String? supabaseUrl;
  String? bucketName;
  final _picker = ImagePicker();
  final _supabaseClient = Supabase.instance.client;
  ImageUploader({
    // required this.supabaseUrl,
    required this.bucketName,
  });
  var uuid = Uuid();
  Future<String?> uploadImage() async {
    // 1. Chọn ảnh từ thư viện
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;

    // 2. Upload ảnh lên Superbase Storage
    final file = File(pickedFile.path);
    final fileBytes = file.readAsBytesSync();

    final fileName = uuid.v4() + '.jpg';
    await _supabaseClient.storage
        .from(bucketName!)
        .uploadBinary(fileName, fileBytes);
    String publicUrl =
        await _supabaseClient.storage.from(bucketName!).getPublicUrl(fileName);
   return publicUrl;
  }
}
