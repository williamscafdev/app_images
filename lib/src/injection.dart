import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:app_images/src/injection.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => init(sl);
