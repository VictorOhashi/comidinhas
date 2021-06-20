import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'submit_button.dart';

const String NomeValueKey = 'nome';
const String TempoPreparoValueKey = 'tempoPreparo';
const String QuantidadePessoasValueKey = 'quantidadePessoas';

class BaseInfoForm extends StatefulWidget {
  final void Function(Map<String, dynamic> data) onSubmit;
  final Map<String, dynamic> initialValue;

  const BaseInfoForm({
    Key? key,
    required this.onSubmit,
    required this.initialValue,
  }) : super(key: key);

  @override
  _BaseInfoFormState createState() => _BaseInfoFormState();
}

class _BaseInfoFormState extends State<BaseInfoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _nome = '';
  int _currentHour = 0;
  int _currentMin = 0;
  int _quantidadePessoas = 1;

  @override
  void initState() {
    _nome = widget.initialValue[NomeValueKey] ?? '';
    _quantidadePessoas = widget.initialValue[QuantidadePessoasValueKey] ?? 1;

    int tempoPreparo = widget.initialValue[TempoPreparoValueKey] ?? 0;
    _currentHour = (tempoPreparo / 60).floor();
    _currentMin = tempoPreparo % 60;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Qual é o nome da sua receita?',
            style: Theme.of(context).textTheme.headline3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initialValue: _nome,
              onSaved: (value) => _nome = value!,
              validator: (value) {
                if (value!.length <= 0) {
                  return 'Coloque um nome para sua receita';
                }
              },
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Quanto tempo demora a receita?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 15),
          Container(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker(
                  value: _currentHour,
                  onChanged: (value) => setState(() => _currentHour = value),
                  minValue: 0,
                  maxValue: 100,
                  itemWidth: 60,
                  textMapper: (text) => int.parse(text) < 10 ? '0$text' : text,
                ),
                Text('hr.'),
                SizedBox(width: 20),
                NumberPicker(
                  value: _currentMin,
                  onChanged: (value) => setState(() => _currentMin = value),
                  minValue: 0,
                  maxValue: 60,
                  itemWidth: 60,
                  textMapper: (text) => int.parse(text) < 10 ? '0$text' : text,
                ),
                Text('min.'),
              ],
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Serve quantas pessoas?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 15),
          NumberPicker(
            value: _quantidadePessoas,
            onChanged: (value) => setState(() => _quantidadePessoas = value),
            minValue: 1,
            maxValue: 100,
            axis: Axis.horizontal,
            itemWidth: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black26),
            ),
          ),
          SizedBox(height: 20),
          SubmitButton(
            onSubmit: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onSubmit({
                  NomeValueKey: _nome,
                  TempoPreparoValueKey: (_currentHour * 60) + _currentMin,
                  QuantidadePessoasValueKey: _quantidadePessoas
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
