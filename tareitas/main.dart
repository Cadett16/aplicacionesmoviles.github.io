import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'BIENVENIDOS',
              style: TextStyle(color: Colors.purple, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Correo Electrónico'),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text('Figuras Geométricas', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Área del Círculo'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CircleAreaScreen()));
              },
            ),
            ListTile(
              title: const Text('Área del Cuadrado'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SquareAreaScreen()));
              },
            ),
            ListTile(
              title: const Text('Área del Triángulo'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TriangleAreaScreen()));
              },
            ),
            ListTile(
              title: const Text('Área del Rectángulo'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RectangleAreaScreen()));
              },
            ),
          ],
        ),
      ),
      body: Center(child: const Text('Selecciona una figura del menú')),
    );
  }
}

class CircleAreaScreen extends StatelessWidget {
  const CircleAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController radiusController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Área del Círculo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: radiusController,
              decoration: const InputDecoration(labelText: 'Radio del círculo'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double radius = double.tryParse(radiusController.text) ?? 0;
                double area = calculateCircleArea(radius);
                showResult(context, 'Área del círculo: $area');
              },
              child: const Text('Calcular Área'),
            ),
          ],
        ),
      ),
    );
  }

  double calculateCircleArea(double radius) {
    return pi * radius * radius;
  }
}

class SquareAreaScreen extends StatelessWidget {
  const SquareAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController sideController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Área del Cuadrado')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: sideController,
              decoration: const InputDecoration(labelText: 'Lado del cuadrado'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double side = double.tryParse(sideController.text) ?? 0;
                double area = calculateSquareArea(side);
                showResult(context, 'Área del cuadrado: $area');
              },
              child: const Text('Calcular Área'),
            ),
          ],
        ),
      ),
    );
  }

  double calculateSquareArea(double side) {
    return side * side;
  }
}

class TriangleAreaScreen extends StatelessWidget {
  const TriangleAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController baseController = TextEditingController();
    final TextEditingController heightController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Área del Triángulo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: baseController,
              decoration: const InputDecoration(labelText: 'Base del triángulo'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(labelText: 'Altura del triángulo'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double base = double.tryParse(baseController.text) ?? 0;
                double height = double.tryParse(heightController.text) ?? 0;
                double area = calculateTriangleArea(base, height);
                showResult(context, 'Área del triángulo: $area');
              },
              child: const Text('Calcular Área'),
            ),
          ],
        ),
      ),
    );
  }

  double calculateTriangleArea(double base, double height) {
    return (base * height) / 2;
  }
}

class RectangleAreaScreen extends StatelessWidget {
  const RectangleAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController lengthController = TextEditingController();
    final TextEditingController widthController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Área del Rectángulo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: lengthController,
              decoration: const InputDecoration(labelText: 'Largo del rectángulo'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: widthController,
              decoration: const InputDecoration(labelText: 'Ancho del rectángulo'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double length = double.tryParse(lengthController.text) ?? 0;
                double width = double.tryParse(widthController.text) ?? 0;
                double area = calculateRectangleArea(length, width);
                showResult(context, 'Área del rectángulo: $area');
              },
              child: const Text('Calcular Área'),
            ),
          ],
        ),
      ),
    );
  }

  double calculateRectangleArea(double length, double width) {
    return length * width;
  }
}

// Función para mostrar el resultado
void showResult(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Resultado'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}
