import 'dart:io';

class FileUtil {
  static Future<bool> doesFileExist(String filePath) async {
    return await File(filePath).exists();
  }
}

// Use o AssetManager para obter o URI do arquivo de áudio
String getAudioUri(String assetPath) {
  return 'asset:///$assetPath';
}

