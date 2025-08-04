class Grade {
  final String id;
  final String userId;  // Changed from studentId to userId to match Supabase
  final String subject;
  final String semester;
  final double grade;  // Changed from score to grade to match Supabase
  final String? churchNote;
  final String? note;  // Additional note field
  final String taskType;  // Changed from GradeType enum to String
  final DateTime? submissionDate;
  final DateTime createdAt;

  Grade({
    required this.id,
    required this.userId,
    required this.subject,
    required this.semester,
    required this.grade,
    this.churchNote,
    this.note,
    required this.taskType,
    this.submissionDate,
    required this.createdAt,
  });

  
  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      subject: json['subject'] as String,
      semester: json['semester'] as String,
      grade: (json['grade'] as num).toDouble(),
      churchNote: json['churchNote'] as String?,
      note: json['note'] as String?,
      taskType: json['taskType'] as String,
      submissionDate: json['submission_date'] == null ? null : DateTime.parse(json['submission_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'subject': subject,
      'semester': semester,
      'grade': grade,
      'churchNote': churchNote,
      'note': note,
      'taskType': taskType,
      'submission_date': submissionDate?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
    };
  }
}
