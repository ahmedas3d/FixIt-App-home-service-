abstract class AuthState {}

class AuthInitial extends AuthState {} // حالة التحميل عند بدء التطبيق

class AuthLoggedIn extends AuthState {} // حالة المستخدم المسجل دخوله

class AuthLoggedOut extends AuthState {} // حالة المستخدم اللي سجل خروجه
