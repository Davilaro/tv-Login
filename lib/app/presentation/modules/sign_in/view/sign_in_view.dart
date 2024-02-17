import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/sign_in_controller.dart';
import '../controller/sign_in_state.dart';
import 'widgets/submit_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    print('🔥🔥🔥🔥build');
    return ChangeNotifierProvider<SignInController>(
        create: (_) => SignInController(
             const SignInState(
                fetching: false,
                password: '',
                username: '',
              ),
              authenticationRepository: context.read(),
            ),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                //Este widget formulario permite agregar validators  los textformfields para controlar validaciones
                child: Builder(builder: (context) {
                  print('🔥🔥🔥🔥🔥Builder');
                  final controller = Provider.of<SignInController>(
                    context,
                    listen: true,
                  );
                  return AbsorbPointer(
                    absorbing: controller.state.fetching,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (text) {
                            controller.onUserNameChanged(text);
                          },
                          decoration:
                              const InputDecoration(hintText: 'username'),
                          validator: (text) {
                            //Modifica el texto ingresado con la condicion de la linea 40 que permite eliminar espacios al inicio y al final, poner en minusculas y usa un null awere (xxx ?? ' ') en caso de que la condicion regrese un null, lo reemplace por un String vacio.
                            text = text;
                            if (text!.isEmpty) {
                              return 'Invalid username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (text) {
                            controller.onPasswordChanged(text);
                          },
                          decoration:
                              const InputDecoration(hintText: 'password'),
                          validator: (text) {
                            //Modifica el texto ingresado con la condicion de la linea 40 que permite eliminar espacios al inicio y al final, poner en minusculas y usa un null awere (xxx ?? ' ') en caso de que la condicion regrese un null, lo reemplace por un String vacio.
                            text = text?.replaceAll(' ', '') ?? '';
                            if (text.length < 4) {
                              return 'Invalid password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        const SubmitButton()
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ));
  }
}
