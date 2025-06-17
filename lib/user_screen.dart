import 'package:example/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserScreen extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the user to rebuild when it changes
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('User Provider Example')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Display current user
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text('Current User:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Name: ${user.name}', style: const TextStyle(fontSize: 16)),
                  Text('Age: ${user.age}', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Input fields
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'New Name',
                border: OutlineInputBorder(),
              ),
            ),
            
            const SizedBox(height: 16),
            
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'New Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            
            const SizedBox(height: 20),
            
            // Buttons to update
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty) {
                      // Call updateName function
                      ref.read(userProvider.notifier).updateName(nameController.text);
                      nameController.clear();
                    }
                  },
                  child: const Text('Update Name'),
                ),
                
                ElevatedButton(
                  onPressed: () {
                    if (ageController.text.isNotEmpty) {
                      final newAge = int.tryParse(ageController.text);
                      if (newAge != null) {
                        // Call updateAge function
                        ref.read(userProvider.notifier).updateAge(newAge);
                        ageController.clear();
                      }
                    }
                  },
                  child: const Text('Update Age'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }}