import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> main() async {
  const url = 'https://iijgyufmahdthvkldcjl.supabase.co';
  const anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlpamd5dWZtYWhkdGh2a2xkY2psIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjM3MDIzMTIsImV4cCI6MTk3OTI3ODMxMn0.mA1UIJG6FMtlwv0rkxOTtbg_-HcPVVx5WAbNyEYVsxs';
  
  print('🔗 Connecting to Supabase: $url');
  print('📊 Inspecting database schema...\n');

  // Try to get table information using REST API
  try {
    final response = await http.get(
      Uri.parse('$url/rest/v1/'),
      headers: {
        'apikey': anonKey,
        'Authorization': 'Bearer $anonKey',
      },
    );
    
    if (response.statusCode == 200) {
      print('✅ Successfully connected to Supabase!');
      print('Response: ${response.body}');
    } else {
      print('❌ Connection failed with status: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  } catch (e) {
    print('❌ Error connecting to Supabase: $e');
  }
  
  // Try common table names
  final commonTables = ['profiles', 'users', 'students', 'teachers', 'classes', 'grades', 'attendance'];
  
  for (final tableName in commonTables) {
    try {
      final response = await http.get(
        Uri.parse('$url/rest/v1/$tableName?limit=1'),
        headers: {
          'apikey': anonKey,
          'Authorization': 'Bearer $anonKey',
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        print('✅ Table "$tableName" exists');
        if (data.isNotEmpty) {
          print('   Sample data structure:');
          final sample = data.first as Map<String, dynamic>;
          sample.forEach((key, value) {
            print('     - $key: ${value.runtimeType} = $value');
          });
        } else {
          print('   (empty table)');
        }
        print('');
      } else if (response.statusCode == 404) {
        // Table doesn't exist, skip silently
      } else {
        print('⚠️  Error accessing table "$tableName": ${response.statusCode}');
        print('   ${response.body}');
      }
    } catch (e) {
      print('❌ Error checking table "$tableName": $e');
    }
  }
}
