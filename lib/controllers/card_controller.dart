import 'package:get/get.dart';

class CardController extends GetxController {
  RxString name = ''.obs;
  RxString age = ''.obs;
  RxString batch = ''.obs;
  RxString regnum = ''.obs;

   clearfields() {
    name.value = '';
    age.value = '';
    batch.value = '';
    regnum.value = '';
  }
}
