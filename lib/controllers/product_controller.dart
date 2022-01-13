import 'package:dokani/constant/AppConstant.dart';
import 'package:dokani/models/filter_dm.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductController extends GetxController {
  List<FilterDm> filterItems = [];

  @override
  void onInit() {
    filterItems = List.from(AppConstant.filterItems);
    super.onInit();
  }

  onFilterSelec(int index) {
    filterItems[index].isSelected = !filterItems[index].isSelected;
    update();
  }
}
