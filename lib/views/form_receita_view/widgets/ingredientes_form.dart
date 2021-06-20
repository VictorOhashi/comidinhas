import 'package:flutter/material.dart';

import 'submit_button.dart';

const String IngredientesValueKey = 'ingredientes';

class IngredientesForm extends StatefulWidget {
  final void Function(Map<String, dynamic> data) onSubmit;
  final void Function(Map<String, dynamic> data) onReturn;
  final Map<String, dynamic> initialValue;

  const IngredientesForm({
    Key? key,
    required this.onSubmit,
    required this.onReturn,
    required this.initialValue,
  }) : super(key: key);

  @override
  _IngredientesFormState createState() => _IngredientesFormState();
}

class _IngredientesFormState extends State<IngredientesForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _ingredientes = [''];

  @override
  void initState() {
    _ingredientes = widget.initialValue[IngredientesValueKey] ?? [''];
    super.initState();
  }

  Map<String, List<String>> _onSave() {
    _formKey.currentState!.save();
    return {IngredientesValueKey: _ingredientes};
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Ingredientes:',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 15),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _ingredientes.length,
            itemBuilder: (ctx, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome do ingrediente',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: _ingredientes[index],
                      onSaved: (value) => _ingredientes[index] = value!,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _ingredientes.removeAt(index);
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _ingredientes.add('');
                });
              },
            ),
          ),
          SizedBox(height: 15),
          SubmitButton(
            onSubmit: () {
              if (_formKey.currentState!.validate()) {
                widget.onSubmit(_onSave());
              }
            },
            onReturn: () => widget.onReturn(_onSave()),
          ),
        ],
      ),
    );
  }
}
