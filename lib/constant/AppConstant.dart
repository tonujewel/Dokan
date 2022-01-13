import 'package:dokani/models/filter_dm.dart';

class AppConstant {
  static final List<FilterDm> filterItems = [
    FilterDm(name: 'Newest', isSelected: true),
    FilterDm(name: 'Oldest', isSelected: false),
    FilterDm(name: 'Price low > High', isSelected: false),
    FilterDm(name: 'Price high > Low', isSelected: false),
    FilterDm(name: 'Best selling', isSelected: false),
  ];
}
