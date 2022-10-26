part of '../register_page.dart';

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            LunchnowTextFormField(label: 'Login'),
            const SizedBox(
              height: 20,
            ),
            LunchnowTextFormField(label: 'Senha', obscureText: true),
            const SizedBox(
              height: 20,
            ),
            LunchnowTextFormField(label: 'Confirmar Senha', obscureText: true),
          ],
        ),
      ),
    );
  }
}
