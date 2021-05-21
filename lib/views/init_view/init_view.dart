import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:comidinhas/views/init_view/init_viewmodel.dart';

class InitViewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitViewViewModel>.reactive(
      viewModelBuilder: () => InitViewViewModel(),
      onModelReady: (model) => model.checkLogedUser(),
      builder: (context, model, _) => Scaffold(
        body: Container(
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('assets/images/welcome_chef.png'),
              Text(
                'Cozinhe você mesmo',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              if (model.isBusy)
                CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  ),
                )
              else
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: model.goToHome,
                    child: Text('Vamos lá'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
