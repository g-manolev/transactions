import 'package:flutter/material.dart';

import '../../../common/navigation/app_route_names.dart';
import '../../../common/widgets/app_text_input.dart';

class AuthForm extends StatelessWidget {
  AuthForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _onLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouteNames.main,
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextInput(
            labelText: 'Email',
            controller: emailController,
            textInputAction: TextInputAction.next,
            validatorText: 'Please enter email',
            autofocus: true,
          ),
          const SizedBox(height: 16),
          AppTextInput(
            labelText: 'Password',
            controller: passwordController,
            validatorText: 'Please enter password',
            obscureText: true,
            onFieldSubmitted: (_) => _onLogin(context),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _onLogin(context),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
