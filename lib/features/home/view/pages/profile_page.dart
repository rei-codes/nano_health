import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../login/providers/token_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomButton(
          onPressed: ref.read(tokenProvider.notifier).logout,
          text: 'Logout',
        ),
      ),
    );
  }
}
