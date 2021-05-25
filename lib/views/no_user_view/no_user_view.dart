import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'no_user_viewmodel.dart';

class NoUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NoUserViewModel>.reactive(
      viewModelBuilder: () => NoUserViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle,
                size: 150,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                'Crie uma conta nova!',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 10),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => model.showLoginBottomSheet(context),
                  child: Text('Criar'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).accentColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
