class Subject {
  final int id;
  final String name;
  final String shortName;
  final bool individual;
  final int individualFactor;
  final int index;
  final bool noAwl;
  final bool active;
  final List<int> curricula;
  final DateTime createdAt;

  Subject({
    required this.id,
    required this.name,
    required this.shortName,
    required this.individual,
    required this.individualFactor,
    required this.index,
    required this.noAwl,
    required this.active,
    required this.curricula,
    required this.createdAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] as int,
      name: json['name'] as String,
      shortName: json['short'] as String,
      individual: json['individual'] as bool,
      individualFactor: json['individualFaktor'] as int,
      index: json['index'] as int,
      noAwl: json['noAwl'] as bool,
      active: json['active'] as bool,
      curricula: List<int>.from(json['curricula']),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'short': shortName,
      'individual': individual,
      'individualFaktor': individualFactor,
      'index': index,
      'noAwl': noAwl,
      'active': active,
      'curricula': curricula,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

