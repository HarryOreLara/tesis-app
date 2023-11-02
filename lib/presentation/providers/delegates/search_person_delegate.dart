import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';

typedef SearchPersonCallback = Future<List<Profile>> Function(String query);

class SearchPersonDelegate extends SearchDelegate<Profile?> {
  final SearchPersonCallback searchPersonCallback;

  SearchPersonDelegate({required this.searchPersonCallback});

  @override
  String get searchFieldLabel => 'Buscar Amigos';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        duration: const Duration(microseconds: 400),
        child: IconButton(
            onPressed: () => query = '', icon: const Icon(Icons.clear)),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("Build Results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
          const Duration(seconds: 4), () => searchPersonCallback(query)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final profile = snapshot.data ?? [];
        return ListView.builder(
          itemCount: profile.length,
          itemBuilder: (context, index) {
            return _PersonaItem(
                profile: profile[index], onMovieSelected: close);
          },
        );
      },
    );
  }
}

class _PersonaItem extends StatelessWidget {
  final Profile profile;
  final Function onMovieSelected;

  const _PersonaItem({required this.profile, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        onMovieSelected(context, profile);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: const Icon(
                    Icons.person_add_alt_rounded,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              width: 10.0,
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.nombre,
                    style: textStyle.titleMedium,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_rounded,
                        color: Colors.yellow.shade700,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
