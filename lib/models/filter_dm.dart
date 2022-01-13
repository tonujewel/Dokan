class FilterDm {
  FilterDm({
    required this.name,
    required this.isSelected,
  });
  late String name;
  late bool isSelected;

  FilterDm.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['isSelected'] = isSelected;
    return _data;
  }
}
