import 'package:gdsc_flutter_camp_2023_app_tres/presentation/services/morty_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mortyServices = Provider.of<MortyServices>(context);
    // final a = context.watch();

    return Scaffold(
      appBar: AppBar(
        title: const Text("App Morty"),
      ),
      body: ListView.builder(
        itemCount: mortyServices.mortyResults.length,
        itemBuilder: (context, index) {
          final morty = mortyServices.mortyResults[index];
          return ListTile(
            title: Text(morty.name),
            subtitle: Text(morty.species.name),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                width: 80,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(morty.image),
              ),
            ),
          );
        },
      ),
    );
  }
}
