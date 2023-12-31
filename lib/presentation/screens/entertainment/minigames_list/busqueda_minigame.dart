import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BusquedaMinigameScreen extends StatelessWidget {
  const BusquedaMinigameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encuentra a la Busqueda'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/minigames');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: const ObjectSearchGame(),
    );
  }
}

class ObjectSearchGame extends StatefulWidget {
  const ObjectSearchGame({super.key});

  @override
   ObjectSearchGameState createState() =>  ObjectSearchGameState();
}

class  ObjectSearchGameState extends State<ObjectSearchGame> {
  List<String> objectsToFind = [
    'Llave',
    'Reloj',
    'Gafas',
    'Teléfono',
    'Moneda'
  ];
  List<String> foundObjects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Objetos a encontrar:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: objectsToFind.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(objectsToFind[index]),
                  trailing: foundObjects.contains(objectsToFind[index])
                      ? const Icon(Icons.check, color: Colors.green)
                      : const Icon(Icons.clear, color: Colors.red),
                  onTap: () {
                    _toggleObjectFound(objectsToFind[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _toggleObjectFound(String object) {
    setState(() {
      if (foundObjects.contains(object)) {
        foundObjects.remove(object);
      } else {
        foundObjects.add(object);
      }
    });
  }
}
