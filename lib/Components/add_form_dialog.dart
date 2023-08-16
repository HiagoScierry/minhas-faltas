import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/cart_item.dart';
import '../Model/card_item.dart';

class AddFormDialog extends StatefulWidget {
  const AddFormDialog({super.key});

  @override
  _AddFormDialogState createState() => _AddFormDialogState();
}

class _AddFormDialogState extends State<AddFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String _selectedHours = '30';
  List<String> listHours = ['30', '45', '60', '75', '90', '120'];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartItemProvider = Provider.of<CartItemProvider>(context);

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
              items: listHours.map((hours) {
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    cartItemProvider.addItem(
                      CardItem(
                        title: _nameController.text,
                        hours: int.parse(_selectedHours),
                        faults: 0,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
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
