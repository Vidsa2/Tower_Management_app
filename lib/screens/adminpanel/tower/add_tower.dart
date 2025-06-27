import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // for date formatting
import 'dart:io';
import 'tower_model.dart';

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

  // ImagePicker instance
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  // Date and Time Pickers
  void _selectDate(TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }

  void _selectTime(TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && mounted) {
      controller.text = pickedTime.format(context);
    }
  }

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final newTower = Tower(
        id: mockTowers.length + 1,
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

  // Pick an image from the gallery
  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
        _imageUrlController.text = _image!.path;
      });
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
                // Image URL or Gallery Selection
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: _image == null
                        ? const Icon(Icons.camera_alt, size: 100)
                        : Image.file(File(_image!.path), fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 16),

                // Custom Rectangle Input Fields with Purple Border and Radius
                _buildTextField(_nameController, 'Name'),
                _buildTextField(_codeController, 'Code'),
                _buildTextField(_districtController, 'District'),
                _buildTextField(_addressController, 'Address'),
                _buildTextField(_coordinatesController, 'Coordinates'),
                _buildTextField(_mapLinkController, 'Map Link'),
                _buildTextField(_descriptionController, 'Description'),
                _buildTextField(_lastInspectorController, 'Last Inspector'),
                _buildDateTimePickerField(
                  _lastInspectionDateController,
                  'Last Inspection Date',
                  _selectDate,
                ),
                _buildDateTimePickerField(
                  _lastInspectionTimeController,
                  'Last Inspection Time',
                  _selectTime,
                ),
                // New Fields
                _buildTextField(_nextInspectorController, 'Next Inspector'),
                _buildDateTimePickerField(
                  _nextInspectionDateController,
                  'Next Inspection Date',
                  _selectDate,
                ),
                _buildDateTimePickerField(
                  _nextInspectionTimeController,
                  'Next Inspection Time',
                  _selectTime,
                ),
                _buildTextField(
                  _repairAndReplacementController,
                  'Repair and Replacement',
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A1B9A),
                  ),
                  onPressed: _submitForm,
                  child: const Text('Save Tower'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom method to create the rectangle input fields with purple border and radius
  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF6A1B9A), width: 2),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  // Custom method to handle date and time pickers for the fields
  Widget _buildDateTimePickerField(
    TextEditingController controller,
    String label,
    Function onTapCallback,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF6A1B9A), width: 2),
          ),
        ),
        onTap: () => onTapCallback(controller),
        readOnly: true,
      ),
    );
  }
}
