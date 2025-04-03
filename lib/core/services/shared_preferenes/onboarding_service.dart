import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static const String _key = 'onboarding_completed';

  // التحقق مما إذا كان الـ Onboarding قد اكتمل
  static Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  // تعيين حالة الـ Onboarding كمكتملة
  static Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }

  // إعادة تعيين حالة الـ Onboarding (لأغراض التطوير)
  static Future<void> resetOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
