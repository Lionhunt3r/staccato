class Attendance {
  final String id;
  final String semester;
  final String group;
  final List<String>? subgroupsSelected;
  final DateTime date;
  final String? userNotes;
  final int? duration;
  final String? tageszeit;
  final String subject;
  final String name;
  final bool attendanceCompleted;
  final bool checkInAvailable;
  final bool checkInActive;
  final String? creator;
  final String? lecturer;
  final List<String>? users;
  final List<String>? absentUsers;
  final DateTime createdAt;

  Attendance({
    required this.id,
    required this.semester,
    required this.group,
    this.subgroupsSelected,
    required this.date,
    this.userNotes,
    this.duration,
    this.tageszeit,
    required this.subject,
    required this.name,
    required this.attendanceCompleted,
    required this.checkInAvailable,
    required this.checkInActive,
    this.creator,
    this.lecturer,
    this.users,
    this.absentUsers,
    required this.createdAt,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json['id'] as String,
      semester: json['semester'] as String,
      group: json['group'] as String,
      subgroupsSelected: json['subgroupsSelected'] != null 
          ? List<String>.from(json['subgroupsSelected']) 
          : null,
      date: DateTime.parse(json['date'] as String),
      userNotes: json['userNotes'] as String?,
      duration: json['duration'] as int?,
      tageszeit: json['tageszeit'] as String?,
      subject: json['subject'] as String,
      name: json['name'] as String,
      attendanceCompleted: json['attendanceCompleted'] as bool,
      checkInAvailable: json['checkInAvailable'] as bool,
      checkInActive: json['checkInActive'] as bool,
      creator: json['creator'] as String?,
      lecturer: json['lecturer'] as String?,
      users: json['users'] != null ? List<String>.from(json['users']) : null,
      absentUsers: json['absent_users'] != null ? List<String>.from(json['absent_users']) : null,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'semester': semester,
      'group': group,
      'subgroupsSelected': subgroupsSelected,
      'date': date.toIso8601String(),
      'userNotes': userNotes,
      'duration': duration,
      'tageszeit': tageszeit,
      'subject': subject,
      'name': name,
      'attendanceCompleted': attendanceCompleted,
      'checkInAvailable': checkInAvailable,
      'checkInActive': checkInActive,
      'creator': creator,
      'lecturer': lecturer,
      'users': users,
      'absent_users': absentUsers,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
