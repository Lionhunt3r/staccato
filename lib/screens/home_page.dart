import 'package:flutter/material.dart';
import '../services/supabase_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final user = SupabaseService.currentUser;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Dirigentenschule'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await SupabaseService.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Willkommen zur Dirigentenschule!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16),
            if (user != null) ...[
              Text('E-Mail: ${user.email}'),
              Text('User ID: ${user.id}'),
              SizedBox(height: 20),
            ],
            Card(
              child: ListTile(
                leading: Icon(Icons.school),
                title: Text('Meine Kurse'),
                subtitle: Text('Übersicht über alle Kurse'),
                onTap: () {
                  // TODO: Navigate to courses
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.grade),
                title: Text('Noten'),
                subtitle: Text('Alle Noten einsehen'),
                onTap: () {
                  // TODO: Navigate to grades
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.check_circle),
                title: Text('Anwesenheit'),
                subtitle: Text('Anwesenheitsstatus überprüfen'),
                onTap: () {
                  // TODO: Navigate to attendance
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.assignment),
                title: Text('Hausaufgaben'),
                subtitle: Text('Hausaufgaben hochladen'),
                onTap: () {
                  // TODO: Navigate to assignments
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
