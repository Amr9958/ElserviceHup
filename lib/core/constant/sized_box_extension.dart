import 'package:flutter/widgets.dart';

extension SizedBoxExtension on num {
  Widget get hSizedBox => SizedBox(height: toDouble());
  Widget get wSizedBox => SizedBox(width: toDouble());
}
