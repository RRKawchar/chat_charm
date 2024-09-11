import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController{

  final ImagePicker picker = ImagePicker();

  Future<String> pickedImage(ImageSource imageSource)async{

    final XFile? image = await picker.pickImage(source:imageSource);
    if(image !=null){
      return image.path;
    }else{
      return "";
    }
  }


}