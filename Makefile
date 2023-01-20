aab:
	flutter build appbundle -t lib/main.dart --dart-define=devTools=false

apk_prod:
	flutter build apk -t lib/main.dart --dart-define=devTools=false

open_apk:
	open build/app/outputs/flutter-apk/

analyze:
	flutter analyze

splash:
	flutter pub run flutter_native_splash:create

iconApp:
	flutter pub run flutter_launcher_icons

b:
	flutter pub run build_runner build --delete-conflicting-outputs

init:
	flutter clean && flutter pub get packages && flutter pub upgrade && flutter pub run build_runner build --delete-conflicting-outputs
