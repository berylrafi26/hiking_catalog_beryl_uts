import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hiking Gear"),
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF134E5E), Color(0xFF71B280)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  "Belum ada produk",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            final products = snapshot.data!.docs;

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      // IMAGE
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          item['image'],
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 15),

                      // TEXT
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text("Rp ${item['price']}"),
                          ],
                        ),
                      ),

               