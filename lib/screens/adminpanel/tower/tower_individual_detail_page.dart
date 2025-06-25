import 'package:flutter/material.dart';
import 'tower_model.dart';

class TowerIndividualDetailPage extends StatefulWidget {
  final Tower tower;

  const TowerIndividualDetailPage({super.key, required this.tower});

  @override
  State<TowerIndividualDetailPage> createState() =>
      _TowerIndividualDetailPageState();
}

class _TowerIndividualDetailPageState extends State<TowerIndividualDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF007AFF)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Text(
              '${widget.tower.name}-${widget.tower.code}',
              style: const TextStyle(
                color: Color(0xFF6A1B9A),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'tower-image-${widget.tower.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.tower.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Details of Tower'),
            _buildEditableRow(
              'District',
              widget.tower.district,
              (val) => setState(() => widget.tower.district = val),
            ),
            _buildEditableRow(
              'Address',
              widget.tower.address,
              (val) => setState(() => widget.tower.address = val),
            ),
            _buildEditableRow(
              'Coordinate',
              widget.tower.coordinates,
              (val) => setState(() => widget.tower.coordinates = val),
            ),
            _buildEditableRow(
              'Map Link',
              widget.tower.mapLink,
              (val) => setState(() => widget.tower.mapLink = val),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Details of last Inspection'),
            _buildEditableRow(
              'Name',
              widget.tower.lastInspector,
              (val) => setState(() => widget.tower.lastInspector = val),
            ),
            _buildEditableRow(
              'Date',
              widget.tower.lastInspectionDate,
              (val) => setState(() => widget.tower.lastInspectionDate = val),
            ),
            _buildEditableRow(
              'Time',
              widget.tower.lastInspectionTime,
              (val) => setState(() => widget.tower.lastInspectionTime = val),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Details of next Inspection'),
            _buildEditableRow(
              'Name',
              widget.tower.nextInspector,
              (val) => setState(() => widget.tower.nextInspector = val),
            ),
            _buildEditableRow(
              'Date',
              widget.tower.nextInspectionDate,
              (val) => setState(() => widget.tower.nextInspectionDate = val),
            ),
            _buildEditableRow(
              'Time',
              widget.tower.nextInspectionTime,
              (val) => setState(() => widget.tower.nextInspectionTime = val),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A1B9A),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Edit all fields functionality coming soon!',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF6A1B9A),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildEditableRow(
    String label,
    String value,
    Function(String) onSave,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
        children: [
          Text(
            '$label : ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8), // Space between label and value
          Expanded(child: Text(value)), // Ensure text takes remaining space
          Align(
            alignment: Alignment.centerRight, // Align the icon to the right
            child: IconButton(
              icon: const Icon(Icons.add, size: 18, color: Color(0xFF6A1B9A)),
              onPressed: () => _showEditDialog(label, value, onSave),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(
    String field,
    String currentValue,
    Function(String) onSave,
  ) {
    final controller = TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit $field'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: 'Enter new $field'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
