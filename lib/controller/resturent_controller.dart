import 'package:get/get.dart';
import 'package:resturant_ui/Model/resturent_model.dart';
import 'package:resturant_ui/service/database.dart';

class ResturentController extends GetxController {
  Rxn<ResturentModel> _returentModel = Rxn<ResturentModel>();

  ResturentModel? get resturentGetter => _returentModel.value;

  @override
  void onInit() {
    super.onInit();
   
    _returentModel.bindStream(Stream.fromFuture(Database().getResturent()));
  }

  void clear() {
    _returentModel.value = ResturentModel();
  }
}