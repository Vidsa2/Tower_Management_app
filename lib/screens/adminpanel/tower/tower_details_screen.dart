import 'package:flutter/material.dart';
import 'tower_individual_detail_page.dart'; // Navigates to the individual tower detail page
import 'tower_model.dart'; // Adjust path if you place the model elsewhere

// This screen matches the '/admin/tower_details' route in your main.dart
class TowerDetailsScreen extends StatefulWidget {
  const TowerDetailsScreen({super.key});

  @override
  State<TowerDetailsScreen> createState() => _TowerDetailsScreenState();
}

class _TowerDetailsScreenState extends State<TowerDetailsScreen> {
  // State to hold the list of towers
  final List<Tower> towers = mockTowers;

  // This function would handle adding a new tower.
  void _addNewTower() {
    // In a real app, this would open a new screen with a form.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Add new tower functionality would be here.'),
        backgroundColor: Color(0xFF007AFF),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      appBar: AppBar(
        title: Text(
          'Towers',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1C1C1E),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: towers.length,
        itemBuilder: (context, index) {
          final tower = towers[index];
          return TowerListItem(
            tower: tower,
            onTap: () {
              // Navigate to the detail screen when an item is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  // We navigate to a new page that shows details for one tower
                  builder: (context) => TowerIndividualDetailPage(tower: tower),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTower,
        backgroundColor: const Color(0xFF007AFF),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }
}

// A reusable widget for displaying a single tower in the list.
class TowerListItem extends StatelessWidget {
  final Tower tower;
  final VoidCallback onTap;

  const TowerListItem({super.key, required this.tower, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                tower.imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 70,
                    height: 70,
                    color: Colors.grey[200],
                    child: Icon(Icons.broken_image, color: Colors.grey[400]),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tower.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tower.code,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
}
