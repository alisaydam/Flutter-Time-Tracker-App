// Ask yourself if you are likely create multiple implementations for those c
//lasses, you can consider creatingg an abstract base class.
// like we do over here

import 'package:time_tracker/app/home/models/job.dart';
import 'package:time_tracker/services/api_path.dart';
import 'package:time_tracker/services/firestore_service.dart';

abstract class Database {
  Future<void> setJob(Job job);
  Stream<List<Job?>> jobsStream();
  Future<void> deleteJob(Job job);
}

String documentIdFromCurrentState() => DateTime.now().toIso8601String();

class FireStoreDatabase implements Database {
  //make sure uid is not null
  FireStoreDatabase({required this.uid}) : assert(uid != null);
  final String uid;
  final _service = FirestoreService.instance;

  @override
  Future<void> setJob(Job job) => _service.setData(
        path: APIPath.job(uid, job.id),
        data: job.toMap(),
      );

  @override
  Future<void> deleteJob(Job job) =>
      _service.deleteData(path: APIPath.job(uid, job.id));

  @override
  Stream<List<Job?>> jobsStream() => _service.collectionStream(
      path: APIPath.jobs(uid),
      builder: (data, documentId) => Job.fromMap(data, documentId));
}
