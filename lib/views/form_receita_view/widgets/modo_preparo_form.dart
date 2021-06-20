import 'package:flutter/material.dart';

import 'submit_button.dart';

const String ModoPreparoValueKey = 'modoPreparo';

class ModoPreparoForm extends StatefulWidget {
  final void Function(Map<String, dynamic> data) onSubmit;
  final void Function(Map<String, dynamic> data) onReturn;
  final Map<String, dynamic> initialValue;

  const ModoPreparoForm({
    Key? key,
    required this.onSubmit,
    required this.onReturn,
    required this.initialValue,
  }) : super(key: key);

  @override
  _ModoPreparoFormState createState() => _ModoPreparoFormState();
}

class _ModoPreparoFormState extends State<ModoPreparoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _modoPreparo = [''];

  @override
  void initState() {
    _modoPreparo = widget.initialValue[ModoPreparoValueKey] ?? [''];
    super.initState();
  }

  Map<String, List<String>> _onSave() {
    _formKey.currentState!.save();
    return {ModoPreparoValueKey: _modoPreparo};
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Modo de Preparo:',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 15),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _modoPreparo.length,
            itemBuilder: (ctx, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLength: 500,
                      minLines: 3,
                      maxLines: 6,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: _modoPreparo[index],
                      onSaved: (value) => _modoPreparo[index] = value!,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _modoPreparo.removeAt(index);
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _modoPreparo.add('');
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
