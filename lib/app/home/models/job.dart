//This is an immutable model class
import 'dart:ui';

class Job {
  Job({required this.id, required this.name, required this.ratePerHour});
  final String id;
  final String? name;
  final int? ratePerHour;

  factory Job.fromMap(Map<String, dynamic> data, String documentId) {
    final String name = data['name'];

    final int ratePerHour = data['ratePerHour'];
    return Job(
      id: documentId,
      name: name,
      ratePerHour: ratePerHour,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ratePerHour': ratePerHour,
    };
  }

  @override
  // TODO: implement hashCode
  int get hashCode => hashValues(id, name, ratePerHour);

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Job otherJob = other as Job;
    return id == otherJob.id &&
        name == otherJob.name &&
        ratePerHour == otherJob.ratePerHour;
  }

  @override
  String toString() => 'id : $id, name: $name, ratePerHour: $ratePerHour';
}
