import 'package:flutter/material.dart';

class AddFormDialog extends StatefulWidget {
  const AddFormDialog({super.key});

  @override
  _AddFormDialogState createState() => _AddFormDialogState();
}

class _AddFormDialogState extends State<AddFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String _selectedHours = '30';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform your form submission here
      final subjectName = _nameController.text;
      final subjectHours = _selectedHours;

      // You can process the data or show a success message
      print('Subject Name: $subjectName');
      print('Subject Hours: $subjectHours');

      // Close the dialog
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Nova Materia'),
      content: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome da Materia',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedHours,
              onChanged: (newValue) {
                setState(() {
                  _selectedHours = newValue!;
                });
              },
              items: ['30', '60', '90'].map((hours) {
                return DropdownMenuItem<String>(
                  value: hours,
                  child: Text('$hours Horas'),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Carga Horária',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Adicionar'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
