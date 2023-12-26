import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/auth/presentation/auth_screen.dart';
import '../screens/bottom_navigation/presentations/bottom_navigation_widget.dart';

class AuthManager extends StatelessWidget {
  const AuthManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (_, snapshot) {
        return snapshot.hasData
            ? const BottomNavigationView()
            : const AuthScreen();
      },
    );
  }
}
