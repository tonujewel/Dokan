class UserDm {
  UserDm({
    required this.id,
    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.url,
    required this.description,
    required this.link,
    required this.locale,
    required this.nickname,
    required this.slug,
    required this.roles,
    required this.registeredDate,
    required this.capabilities,
    required this.extraCapabilities,
    required this.meta,
  });
  late final int id;
  late final String username;
  late final String name;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String url;
  late final String description;
  late final String link;
  late final String locale;
  late final String nickname;
  late final String slug;
  late final List<String> roles;
  late final String registeredDate;
  late final Capabilities capabilities;
  late final ExtraCapabilities extraCapabilities;
  late final List<dynamic> meta;

  UserDm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    url = json['url'];
    description = json['description'];
    link = json['link'];
    locale = json['locale'];
    nickname = json['nickname'];
    slug = json['slug'];
    roles = List.castFrom<dynamic, String>(json['roles']);
    registeredDate = json['registered_date'];
    capabilities = Capabilities.fromJson(json['capabilities']);
    extraCapabilities = ExtraCapabilities.fromJson(json['extra_capabilities']);
    meta = List.castFrom<dynamic, dynamic>(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['name'] = name;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['url'] = url;
    _data['description'] = description;
    _data['link'] = link;
    _data['locale'] = locale;
    _data['nickname'] = nickname;
    _data['slug'] = slug;
    _data['roles'] = roles;
    _data['registered_date'] = registeredDate;
    _data['capabilities'] = capabilities.toJson();
    _data['extra_capabilities'] = extraCapabilities.toJson();
    _data['meta'] = meta;
    return _data;
  }
}

class Capabilities {
  Capabilities({
    required this.read,
    required this.level_0,
    required this.subscriber,
  });
  late final bool read;
  late final bool level_0;
  late final bool subscriber;

  Capabilities.fromJson(Map<String, dynamic> json) {
    read = json['read'];
    level_0 = json['level_0'];
    subscriber = json['subscriber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['read'] = read;
    _data['level_0'] = level_0;
    _data['subscriber'] = subscriber;
    return _data;
  }
}

class ExtraCapabilities {
  ExtraCapabilities({
    required this.subscriber,
  });
  late final bool subscriber;

  ExtraCapabilities.fromJson(Map<String, dynamic> json) {
    subscriber = json['subscriber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['subscriber'] = subscriber;
    return _data;
  }
}

// ignore: camel_case_types
class links {
  links({
    required this.self,
    required this.collection,
  });
  late final List<Self> self;
  late final List<Collection> collection;

  // ignore: unused_element
  links.fromJson(Map<String, dynamic> json) {
    self = List.from(json['self']).map((e) => Self.fromJson(e)).toList();
    collection = List.from(json['collection'])
        .map((e) => Collection.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['self'] = self.map((e) => e.toJson()).toList();
    _data['collection'] = collection.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Self {
  Self({
    required this.href,
  });
  late final String href;

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['href'] = href;
    return _data;
  }
}

class Collection {
  Collection({
    required this.href,
  });
  late final String href;

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['href'] = href;
    return _data;
  }
}
