class UserProfile {
  final String id;
  final String? email;
  final String firstName;
  final String lastName;
  final String? gender;
  final List<int>? groups;  // Changed to List<int> to match Supabase structure
  final bool active;
  final int? position;  // Changed to int to match Supabase structure
  final String? picture;
  final String? birthday;
  final int? church;  // Changed to int to match Supabase structure
  final String? phoneNr;
  final String? street;
  final String? streetNr;
  final String? city;
  final String? plz;
  final String? homeNr;
  final List<dynamic>? individuals;
  final List<dynamic>? responsiblesExcluded;
  final Map<String, dynamic>? settings;
  final String? subgroup;
  final List<dynamic>? subgroupHistory;
  final List<dynamic>? subjects;
  final List<dynamic>? individualsHistory;
  final String? birthdate;  // Additional birthdate field
  final List<String>? userRoles;
  final DateTime createdAt;

  UserProfile({
    required this.id,
    this.email,
    required this.firstName,
    required this.lastName,
    this.gender,
    this.groups,
    required this.active,
    this.position,
    this.picture,
    this.birthday,
    this.church,
    this.phoneNr,
    this.street,
    this.streetNr,
    this.city,
    this.plz,
    this.homeNr,
    this.individuals,
    this.responsiblesExcluded,
    this.settings,
    this.subgroup,
    this.subgroupHistory,
    this.subjects,
    this.individualsHistory,
    this.birthdate,
    this.userRoles,
    required this.createdAt,
  });

  String get fullName => '$firstName $lastName';
  
  bool get isTeacher => userRoles?.contains('teacher') == true || userRoles?.contains('lecturer') == true;
  bool get isStudent => userRoles?.contains('student') == true;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as String,
      email: json['email'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: json['gender'] as String?,
      groups: json['groups'] != null ? List<int>.from(json['groups']) : null,
      active: json['active'] as bool? ?? true,
      position: json['position'] as int?,
      picture: json['picture'] as String?,
      birthday: json['birthday'] as String?,
      church: json['church'] as int?,
      phoneNr: json['phoneNr'] as String?,
      street: json['street'] as String?,
      streetNr: json['streetNr'] as String?,
      city: json['city'] as String?,
      plz: json['plz'] as String?,
      homeNr: json['homeNr'] as String?,
      individuals: json['individuals'] as List<dynamic>?,
      responsiblesExcluded: json['responsiblesExcluded'] as List<dynamic>?,
      settings: json['settings'] as Map<String, dynamic>?,
      subgroup: json['subgroup'] as String?,
      subgroupHistory: json['subgroupHistory'] as List<dynamic>?,
      subjects: json['subjects'] as List<dynamic>?,
      individualsHistory: json['individualsHistory'] as List<dynamic>?,
      birthdate: json['birthdate'] as String?,
      userRoles: json['userRoles'] != null ? List<String>.from(json['userRoles']) : null,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'groups': groups,
      'active': active,
      'position': position,
      'picture': picture,
      'birthday': birthday,
      'church': church,
      'phoneNr': phoneNr,
      'street': street,
      'streetNr': streetNr,
      'city': city,
      'plz': plz,
      'homeNr': homeNr,
      'individuals': individuals,
      'responsiblesExcluded': responsiblesExcluded,
      'settings': settings,
      'subgroup': subgroup,
      'subgroupHistory': subgroupHistory,
      'subjects': subjects,
      'individualsHistory': individualsHistory,
      'birthdate': birthdate,
      'userRoles': userRoles,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

enum UserRole {
  student,
  teacher,
  admin,
}
