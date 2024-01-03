import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => ColorScreen(),
        "/edit": (context) => EditColorScreen(),
      },
    );
  }
}

class ColorScreen extends StatefulWidget {
  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color _color = const Color.fromARGB(255, 255, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/edit", arguments: _color);
            },
            child: const Text("cambiar color"),
          ),
        ),
      ),
    );
  }
}

class EditColorScreen extends StatefulWidget {
  @override
  State<EditColorScreen> createState() => _EditColorScreenState();
}

class _EditColorScreenState extends State<EditColorScreen> {
  late List<TextEditingController> _conts;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final Color color = ModalRoute.of(context).settings.arguments;
    _conts = [
      for (int i = 0; i < 3; i++) TextEditingController(),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    const List<String> colores = ["red", "green", "blue"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Color"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(children: [
          Row(
            children: [
              for (int i = 0; i < 3; i++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: _conts[i],
                      decoration: InputDecoration(labelText: colores[i]),
                    ),
                  ),
                ),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text("monkeys"))
        ]),
      ),
    );
  }
}
