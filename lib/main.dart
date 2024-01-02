import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/config/config.dart';
import 'package:rick_and_morty/infrastructure/infrastructure.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final datasource = RickAndMortyApiDatasource();
    final repository = RickAndMortyRepositoryImpl(datasource: datasource);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => PersonajesProvider(repositoryImpl: repository)
            ..getCharacter()
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty App',
        theme: AppTheme().getTheme(),
      ),
    );
  }
}