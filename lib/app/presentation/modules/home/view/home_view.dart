import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/controllers/session_controller.dart';
import '../../../routes/routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final SessionController sessionController = Provider.of(context);
    final user = sessionController.state!;
    return  Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              if(user.avatarPath != null)
                  Image.network('https://image.tmdb.org/t/p/w500${user.avatarPath}'),
              
              Text(user.id.toString(),
                style: const TextStyle(
                  fontSize: 30
                    ) 
                  ),
              Text(user.username.toString(), 
                  style:  const TextStyle(
                    fontSize: 20.0
                      )
                    ),
              TextButton( //Paso 5 Colocar Textbuton para cerrar sesion y llamamos al metodo signOut()
                onPressed: () async {
                  await sessionController.signOut();
                   if (mounted) {
                     Navigator.pushReplacementNamed(
                    context,
                     Routes.signIn
                     );
                   }
                  
                },
                child: const Text('SIGN OUT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
