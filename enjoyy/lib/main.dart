import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:enjoyy/module/choose_mode/bloc/theme_cubit.dart';
import 'package:enjoyy/module/splashscreen_page.dart';
import 'package:enjoyy/core/utils/theme_path.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hydrated Storage untuk menyimpan state cubit
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  // Jalankan aplikasi
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Inisialisasi ThemeCubit yang di-manage oleh HydratedBloc
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            theme: AppTheme.lightTheme, // Tema Light
            darkTheme: AppTheme.darkTheme, // Tema Dark
            themeMode: mode, // Pengaturan tema dari ThemeCubit
            home: SplashscreenPage(), // Halaman splash screen
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
