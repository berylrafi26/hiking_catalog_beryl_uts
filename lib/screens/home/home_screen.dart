import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/product_card.dart';

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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "Terjadi error",
                  style: TextStyle(color: Colors.white),
                ),
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

                final data = item.data() as Map<String, dynamic>;

                return ProductCard(
                  name: data['name'] ?? "No Name",
                  price: data['price'] ?? 0,
                  image: data['image'] ?? "",
                  onAdd: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${data['name']} ditambahkan")),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
