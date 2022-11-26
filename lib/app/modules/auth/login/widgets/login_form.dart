part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final controller = Modular.get<LoginController>();

  @override
  void dispose() {
    _loginEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          LunchnowTextFormField(
            label: 'Email',
            controller: _loginEC,
            validator: Validatorless.multiple([
              Validatorless.required('Email é obrigatório'),
              Validatorless.email('Email inválido')
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          LunchnowTextFormField(
            label: 'Senha',
            obscureText: true,
            controller: _passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatória'),
              Validatorless.min(8, 'Senha deve conter pelo menos 8 caracteres'),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          LunchnowDefaultButton(
            label: 'Entrar',
            onPressed: () async {
              final formValid = _formKey.currentState?.validate() ?? false;
              if (formValid) {
                await controller.login(_loginEC.text, _passwordEC.text);
              }
            },
          )
        ],
      ),
    );
  }
}
