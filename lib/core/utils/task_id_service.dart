import 'package:hive/hive.dart';

class TaskIdService {
  static const String idBoxName = 'idBox';
  static const String taskIdKey = 'taskIdKey';

  static Future<int> getNextTaskId() async {
    var box = await Hive.openBox<int>(idBoxName);
    int currentId = box.get(taskIdKey, defaultValue: 0)!;
    int nextId = currentId + 1;
    await box.put(taskIdKey, nextId);
    return nextId;
  }
}
