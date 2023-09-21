import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../../utils/route_wrapper.dart';
import '../../../widgets/today_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/screens/edit_profile/presentation/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            TodayAppBar(
              hasAction: true,
              buttonWidth: 144.0,
              title: S.of(context).profile,
              buttonTitle: S.of(context).edit,
              onPressed: () => RouteWraper().push(
                context,
                const EditProfileScreen(),
              ),
            ),
            const Expanded(
              child: _ProfileBodyWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileBodyWidget extends StatelessWidget {
  const _ProfileBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: TextButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(
              SignOutEvent(),
            );
          },
          child: const Text(
            'Выйти',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
