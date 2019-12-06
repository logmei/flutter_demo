import 'package:get_it/get_it.dart';
import 'package:logmei_flutter_demo/service/TelSmsService.dart';

GetIt locator = GetIt.instance;

void setupLocater(){
   locator.registerSingleton(TelSmsService());
}