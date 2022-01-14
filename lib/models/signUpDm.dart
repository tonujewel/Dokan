class SignUpDm {
  SignUpDm({
    required this.code,
    required this.message,
  });
  late final int code;
  late final String message;

  SignUpDm.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    return _data;
  }
}
