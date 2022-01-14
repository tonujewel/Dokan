class LoginDm {
  LoginDm({
    required this.token,
    required this.userEmail,
    required this.userNicename,
    required this.userDisplayName,
  });
  late final String token;
  late final String userEmail;
  late final String userNicename;
  late final String userDisplayName;

  LoginDm.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userEmail = json['user_email'];
    userNicename = json['user_nicename'];
    userDisplayName = json['user_display_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['user_email'] = userEmail;
    _data['user_nicename'] = userNicename;
    _data['user_display_name'] = userDisplayName;
    return _data;
  }
}
