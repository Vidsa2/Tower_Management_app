import 'package:flutter/material.dart';
import 'tower_individual_detail_page.dart';
import 'tower_model.dart';
import 'add_tower.dart';

class TowerDetailsScreen extends StatefulWidget {
  const TowerDetailsScreen({super.key});

  @override
  State<TowerDetailsScreen> createState() => _TowerDetailsScreenState();
}

class _TowerDetailsScreenState extends State<TowerDetailsScreen> {
  final List<Tower> towers = mockTowers;

  void _addNewTower() async {
    // Navigate to the AddTowerPage and wait for the new tower data
    final newTower = await Navigator.push<Tower>(
      context,
      MaterialPageRoute(builder: (context) => const AddTowerPage()),
    );

    // Guard the use of context with 'mounted' to avoid issues if the widget is disposed
    if (!mounted) return;

    if (newTower != null) {
      setState(() {
        towers.add(newTower); // Add the new tower to the list
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('New tower added successfully!'),
          backgroundColor: Color(0xFF6A1B9A),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 4, left: 8),
                          child: Text(
                            'Tower Details',
                            style: TextStyle(
                              color: Color.fromARGB(255, 73, 27, 109),
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Towers',
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Center(
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: towers.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: _addNewTower,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add_circle,
                            size: 64,
                            color: Color.fromARGB(255, 73, 27, 109),
                          ),
                        ),
                      ),
                    );
                  } else {
                    final tower = towers[index - 1];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TowerIndividualDetailPage(tower: tower),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 177, 167, 167),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child: Image.asset(
                                  tower.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Icon(
                                        Icons.broken_image,
                                        size: 48,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                color: Color.fromARGB(255, 73, 27, 109),
                                child: Column(
                                  children: [
                                    Text(
                                      tower.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      tower.code,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(
                                          255,
                                          217,
                                          216,
                                          216,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
