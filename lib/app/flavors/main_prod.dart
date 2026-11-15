import 'package:shakel_mobile/app/bootstrap/bootstrap.dart';
import 'package:shakel_mobile/app/config/environment.dart';

Future<void> main() async {
  await bootstrap(
    environment: Environment.production,
  );
}
