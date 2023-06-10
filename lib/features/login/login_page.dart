import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nano_health/core/utils/assets.dart';
import 'package:nano_health/core/widgets/custom_button.dart';
import 'package:nano_health/features/home/view/home_navigation.dart';
import 'package:nano_health/features/login/models/login_request.dart';
import 'package:nano_health/features/login/providers/token_provider.dart';

import '../../core/utils/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: FocusScope.of(context).unfocus,
      child: ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          headerSliverBuilder: (_, __) {
            return [
              SliverAppBar(
                expandedHeight: 300,
                elevation: 0,
                backgroundColor: AppColors.blue,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: AppColors.gradient,
                      image: DecorationImage(
                        scale: 2,
                        image: AssetImage(R.images.logo),
                      ),
                    ),
                  ),
                  title: const Row(
                    children: [
                      SizedBox(width: 16),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: const _Form(),
        ),
      ),
    );
  }
}

class _Form extends HookConsumerWidget {
  const _Form();

  @override
  Widget build(BuildContext context, ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    final showPassword = useState(false);

    final email = useTextEditingController();
    final password = useTextEditingController();

    final isEmailEmpty = useListenableSelector(email, () => email.text.isEmpty);

    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const SizedBox(height: 24),
              TextFormField(
                controller: email,
                enableSuggestions: false,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                onSaved: (v) => v?.trim(),
                validator: (value) {
                  // I didn't implement an email regex here
                  // because api doesn't provide me a correct email
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  suffixIcon: Icon(
                    Icons.check_circle_outline_rounded,
                    color: isEmailEmpty ? Colors.grey : Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: password,
                obscureText: !showPassword.value,
                enableSuggestions: false,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                onSaved: (v) => v?.trim(),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your password';
                  }
                  if (value!.length < 6) {
                    return 'Password should be minimum 6 characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () => showPassword.value = !showPassword.value,
                    icon: Icon(
                      showPassword.value
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.maxFinite,
                height: 54,
                child: CustomButton(
                  text: 'Continue',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final messenger = ScaffoldMessenger.of(context);
                      final navigator = Navigator.of(context);

                      final model = LoginRequest(
                        username: email.text,
                        password: password.text,
                      );

                      try {
                        await ref.read(tokenProvider.notifier).login(model);
                        navigator.pushReplacement(
                          MaterialPageRoute(
                              builder: (_) => const HomeNavigation()),
                        );
                      } catch (e) {
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text('$e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
              const SizedBox(height: 48),
              const Text('NEED HELP?'),
            ],
          ),
        ),
      ),
    );
  }
}
