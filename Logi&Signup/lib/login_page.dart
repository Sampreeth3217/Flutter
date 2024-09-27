import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Aquavigil',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // Email Input
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Id',
                labelStyle: const TextStyle(color: Colors.white),
                fillColor: Colors.white12,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            // Password Input
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.white),
                fillColor: Colors.white12,
                filled: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off, color: Colors.white),
                  onPressed: () {},
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Sign in', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(child: Divider(color: Colors.white54)),
                Text(
                  " or sign in with ",
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(child: Divider(color: Colors.white54)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.android, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.apple, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?", style: TextStyle(color: Colors.white)),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text('Sign Up', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}