import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyubook/data/models/model_character.dart';

class CharacterDetailsWidget extends StatelessWidget {
  final Results RickNMortyCharacter;
  const CharacterDetailsWidget({
    Key? key,
    required this.RickNMortyCharacter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RickNMortyCharacter.name),
      ),
      body: Column(
        children: [
          Image.network(RickNMortyCharacter.image),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                'Status ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                RickNMortyCharacter.status,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Text(
                'Gender ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                RickNMortyCharacter.gender,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Text(
                'Species ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                RickNMortyCharacter.species,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Text(
                'location ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                RickNMortyCharacter.location.name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Text(
                'Dimension ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                RickNMortyCharacter.origin.name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}