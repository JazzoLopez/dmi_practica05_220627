// Configuración centralizada de rutas usando GoRouter.
// Define la ubicación inicial y el mapeo de rutas a pantallas.
import 'package:go_router/go_router.dart';

import 'package:practica05/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
