part of '../login_page.dart';

class _LoginRegisterButtons extends StatelessWidget {
  const _LoginRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        RoundedButtonWithIcon(
          color: const Color(0xFF4267B3),
          icon: LunchNowIcons.facebook,
          label: 'Facebook',
          width: .42.sw,
          onTap: () {},
        ),
        RoundedButtonWithIcon(
          color: const Color(0xFFE15031),
          icon: LunchNowIcons.google,
          label: 'Google',
          width: .42.sw,
          onTap: () {},
        ),
        RoundedButtonWithIcon(
          color: Colors.green,
          icon: Icons.mail,
          label: 'Cadastrar-se',
          width: .42.sw,
          onTap: () {
            Navigator.pushNamed(context, '/auth/register/');
          },
        ),
      ],
    );
  }
}
