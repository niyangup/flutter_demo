import 'package:filesize/filesize.dart';

///根据字节数计算合适的大小单位
class FileSizeUtil {
  static String conversionByteToSize(dynamic size) {
    return filesize(size);
  }
}
