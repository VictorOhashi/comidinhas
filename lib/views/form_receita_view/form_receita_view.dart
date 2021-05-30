import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'form_receita_viewmodel.dart';
import 'widgets/base_info_receita.dart';

class FormReceitaView extends StatelessWidget {
  const FormReceitaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FormReceitaViewModel>.reactive(
      viewModelBuilder: () => FormReceitaViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                BaseInfoReceita(),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Avançar >'),
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
