import 'package:clot/src/core/model/user_data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static late Box box;
  static const clotBox = 'clot_box';

  //! Singleton
  static HiveService get instantiate => HiveService.init();
  HiveService.init();

  //! init
  void createBox() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserDataModelAdapter());
    box = await Hive.openBox(clotBox);
  }

  //! write
  void writeData({required key, required value}) async {
    await box.put(key, value);
    print('write ${[key, value]}');
  }

  //! read
  dynamic readData({required key}) {
    print(box.get(key));
    return box.get(key);
  }

  //! delete
  void deleteData({required key}) {
    box.delete(key);
    print('Deleted $key');
  }
}
