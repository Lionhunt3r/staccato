class Group {
  final int id;
  final String name;
  final int curriculum;
  final bool active;
  final DateTime? inactiveDate;
  final int startSemester;
  final int endSemester;
  final List<String> roles;
  final List<String> subgroups;
  final String internalName;
  final String? password;
  final DateTime createdAt;

  Group({
    required this.id,
    required this.name,
    required this.curriculum,
    required this.active,
    this.inactiveDate,
    required this.startSemester,
    required this.endSemester,
    required this.roles,
    required this.subgroups,
    required this.internalName,
    this.password,
    required this.createdAt,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'] as int,
      name: json['name'] as String,
      curriculum: json['curriculum'] as int,
      active: json['active'] as bool,
      inactiveDate: json['inactiveDate'] != null 
          ? DateTime.parse(json['inactiveDate'] as String) 
          : null,
      startSemester: json['startSemester'] as int,
      endSemester: json['endSemester'] as int,
      roles: List<String>.from(json['roles'] ?? []),
      subgroups: List<String>.from(json['subgroups'] ?? []),
      internalName: json['internal_name'] as String,
      password: json['password'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'curriculum': curriculum,
      'active': active,
      'inactiveDate': inactiveDate?.toIso8601String(),
      'startSemester': startSemester,
      'endSemester': endSemester,
      'roles': roles,
      'subgroups': subgroups,
      'internal_name': internalName,
      'password': password,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
