import 'package:comidinhas/viewmodels/start_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.checkUserLogIn(),
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
              if (model.busy)
                CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  ),
                )
              else
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    onPressed: model.goTo,
                    child: Text('Vamos lá'),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
