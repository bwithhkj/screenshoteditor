import 'package:dio/dio.dart';
import 'dart:io';

Dio dio = Dio();

Future<String> uploadImage(File imageFile, String refPt) async {
  try {
    // Create a FormData object to send the image as binary data
    FormData formData = FormData.fromMap({
      "image":
          await MultipartFile.fromFile(imageFile.path, filename: "image.jpg"),
    });

    // Make the post request to the API
    var response = await dio.post("http://192.168.43.249:2020/predict/",
        data: formData, queryParameters: {"refPt": refPt});
    return response.data;
  } catch (e) {
    print(e);
    throw Exception('Failed to upload image to the API');
  }
}


// {
//     "word": "Messages",
//     "coordinate": [
//         162,
//         272,
//         328,
//         307
//     ],
//     "starting_position": [
//         162,
//         299
//     ],
//     "font": "Walkway",
//     "image": fjiifidfsskf
// }