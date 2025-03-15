import 'dart:convert';
import 'dart:io';

void main() {
  const String jsonConfig = '''
  {
    "folders": [],
    "files": {
      "lib/features/auth/presentation/screens/SignIn_screen.dart": "",
      "lib/features/auth/presentation/screens/SignUp_screen.dart": "",
      "lib/features/auth/presentation/widgets/SignIn_form.dart": "",
      "lib/features/auth/presentation/widgets/SignUp_form.dart": "",
      "lib/features/auth/presentation/widgets/custom_text_form_field.dart": ""
    },
    "packages": []
  }
  ''';

  final Map<String, dynamic> config = json.decode(jsonConfig);

  // إنشاء المجلدات
  List<String> folders = List<String>.from(config['folders']);
  for (var folder in folders) {
    Directory(folder).createSync(recursive: true);
    print('Created folder: $folder');
  }

  // إنشاء الملفات
  Map<String, String> files = Map<String, String>.from(config['files']);
  files.forEach((path, content) {
    File file = File(path);
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
    print('Created file: $path');
  });

  // تثبيت الباكجات
  List<String> packages = List<String>.from(config['packages']);
  if (packages.isNotEmpty) {
    print('Installing packages...');
    Process.runSync('flutter', ['pub', 'add', ...packages]);
    print('Packages installed: ${packages.join(", ")}');
  }

  print('Project setup completed successfully!');
}
