import 'dart:io';

extension FileExtension on File {
  ///[name] => path.split("/").last
  String get name => path.split("/").last;
}
