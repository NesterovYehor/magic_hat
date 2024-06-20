import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_hat/blocs/character_bloc/character_bloc.dart';
import 'package:magic_hat/blocs/character_bloc/character_event.dart';
import 'package:magic_hat/repositories/api_repository.dart';
import 'package:magic_hat/repositories/api_repository_impl.dart';
import 'package:magic_hat/ui/theme/color_theme.dart';
import 'package:magic_hat/ui/widgents/bottom_navigation_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ApiRepository apiRepository = ApiRepositoryImpl();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CharacterBloc(apiRepository)..add(FetchCharacters()))
      ], 
      child: MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: NavBar(),
      )
    );
  }
}


