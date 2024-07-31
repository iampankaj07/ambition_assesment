import 'package:ambitionguru_task/presentation/hierarchy/hierarchy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HierarchyScreen extends StatefulWidget {
  const HierarchyScreen({super.key});

  @override
  State<HierarchyScreen> createState() => _HierarchyScreenState();
}

class _HierarchyScreenState extends State<HierarchyScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hierarchy Finder')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Hierarchy ID (e.g., Item 1.1.2.2)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                String value = _controller.text.trim();
                context.read<HierarchyProvider>().findHierarchyPath(value);
              },
              child: const Text('Find Path'),
            ),
            const SizedBox(height: 20),
            Consumer<HierarchyProvider>(
              builder: (context, provider, child) {
                return Text(
                  provider.hierarchyPath,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
