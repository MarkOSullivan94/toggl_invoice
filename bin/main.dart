
import 'package:calculate_invoice/toggl_service.dart';

Future<void> main(List<String> arguments) async {
  final service = TogglService();
  await service.start();
}
