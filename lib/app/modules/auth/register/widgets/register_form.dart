part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final controller = Modular.get<RegisterController>();
  final _formKey = GlobalKey<FormState>();
  final _usernameEC = TextEditingController();
  final _cpfEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            LunchnowTextFormField(
              label: 'Login',
              controller: _usernameEC,
              validator: Validatorless.required("Login obrigatório"),
            ),
            const SizedBox(
              height: 15,
            ),
            LunchnowTextFormField(
              label: 'CPF',
              controller: _cpfEC,
              validator: Validatorless.multiple([
                Validatorless.cpf("CPF deve ser válido"),
                Validatorless.required("CPF precisa ser preenchido"),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            LunchnowTextFormField(
              label: 'Email',
              controller: _emailEC,
              validator: Validatorless.multiple([
                Validatorless.required('Email obrigatório'),
                Validatorless.email("Email deve ser um e-mail válido"),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            LunchnowTextFormField(
              label: 'Senha',
              obscureText: true,
              controller: _passwordEC,
              validator: Validatorless.multiple([
                Validatorless.required("Senha obrigatória"),
                Validatorless.min(
                    8, "Senha precisa ter pelo menos 8 caracteres"),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            LunchnowTextFormField(
              label: 'Confirmar Senha',
              obscureText: true,
              validator: Validatorless.multiple([
                Validatorless.required("Confirmar senha obrigatória"),
                Validatorless.min(
                    8, "Confirmar senha precisa ter pelo menos 8 caracteres"),
                Validatorless.compare(_passwordEC, "As senhas dever ser iguais")
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            LunchnowDefaultButton(
                onPressed: () {
                  final formValid = _formKey.currentState?.validate() ?? false;

                  if (formValid) {
                    controller.register(
                      username: _usernameEC.text,
                      cpf: _cpfEC.text,
                      email: _emailEC.text,
                      password: _passwordEC.text,
                    );
                  }
                },
                label: 'Cadastrar'),
          ],
        ),
      ),
    );
  }
}
