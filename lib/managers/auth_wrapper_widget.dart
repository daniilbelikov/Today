import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:today/screens/auth/presentation/auth_screen.dart';
import 'package:today/screens/bottom_navigation/presentation/widgets/bottom_navigation_widget.dart';

class AuthWrapperWidget extends StatelessWidget {
  const AuthWrapperWidget({super.key});

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
