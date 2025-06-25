import 'package:flutter/material.dart';
import 'tower_model.dart'; // Make sure the Tower class and mockTowers are properly imported

class AddTowerPage extends StatefulWidget {
  const AddTowerPage({super.key});

  @override
  State<AddTowerPage> createState() => _AddTowerPageState();
}

class _AddTowerPageState extends State<AddTowerPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each input field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _coordinatesController = TextEditingController();
  final TextEditingController _mapLinkController = TextEditingController();
  final TextEditingController _lastInspectorController =
      TextEditingController();
  final TextEditingController _lastInspectionDateController =
      TextEditingController();
  final TextEditingController _lastInspectionTimeController =
      TextEditingController();
  final TextEditingController _nextInspectorController =
      TextEditingController();
  final TextEditingController _nextInspectionDateController =
      TextEditingController();
  final TextEditingController _nextInspectionTimeController =
      TextEditingController();
  final TextEditingController _repairAndReplacementController =
      TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final newTower = Tower(
        id:
            mockTowers.length +
            1, // You can generate a unique ID based on your logic
        name: _nameController.text,
        code: _codeController.text,
        imageUrl: _imageUrlController.text,
        description: _descriptionController.text,
        district: _districtController.text,
        address: _addressController.text,
        coordinates: _coordinatesController.text,
        mapLink: _mapLinkController.text,
        lastInspector: _lastInspectorController.text,
        lastInspectionDate: _lastInspectionDateController.text,
        lastInspectionTime: _lastInspectionTimeController.text,
        nextInspector: _nextInspectorController.text,
        nextInspectionDate: _nextInspectionDateController.text,
        nextInspectionTime: _nextInspectionTimeController.text,
        repairAndReplacement: _repairAndReplacementController.text,
      );

      // Go back to the previous page with the new tower data
      Navigator.pop(context, newTower);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Tower'),
        backgroundColor: const Color(0xFF6A1B9A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a name' : null,
                ),
                TextFormField(
                  controller: _codeController,
                  decoration: const InputDecoration(labelText: 'Code'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a code' : null,
                ),
                TextFormField(
                  controller: _imageUrlController,
                  decoration: const InputDecoration(labelText: 'Image URL'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter an image URL' : null,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                TextFormField(
                  controller: _districtController,
                  decoration: const InputDecoration(labelText: 'District'),
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                TextFormField(
                  controller: _coordinatesController,
                  decoration: const InputDecoration(labelText: 'Coordinates'),
                ),
                TextFormField(
                  controller: _mapLinkController,
                  decoration: const InputDecoration(labelText: 'Map Link'),
                ),
                TextFormField(
                  controller: _lastInspectorController,
                  decoration: const InputDecoration(
                    labelText: 'Last Inspector',
                  ),
                ),
                TextFormField(
                  controller: _lastInspectionDateController,
                  decoration: const InputDecoration(
                    labelText: 'Last Inspection Date',
                  ),
                ),
                TextFormField(
                  controller: _lastInspectionTimeController,
                  decoration: const InputDecoration(
                    labelText: 'Last Inspection Time',
                  ),
                ),
                TextFormField(
                  controller: _nextInspectorController,
                  decoration: const InputDecoration(
                    labelText: 'Next Inspector',
                  ),
                ),
                TextFormField(
                  controller: _nextInspectionDateController,
                  decoration: const InputDecoration(
                    labelText: 'Next Inspection Date',
                  ),
                ),
                TextFormField(
                  controller: _nextInspectionTimeController,
                  decoration: const InputDecoration(
                    labelText: 'Next Inspection Time',
                  ),
                ),
                TextFormField(
                  controller: _repairAndReplacementController,
                  decoration: const InputDecoration(
                    labelText: 'Repair and Replacement',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Save Tower'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A1B9A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
