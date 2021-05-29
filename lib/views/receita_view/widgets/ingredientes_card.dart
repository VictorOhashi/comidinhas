import 'package:flutter/material.dart';

class IngredientesCard extends StatelessWidget {
  final List<String> ingredientes;

  IngredientesCard({Key? key, required this.ingredientes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredientes:',
              style: Theme.of(context).textTheme.headline3,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (ctx, i) => SizedBox(height: 10),
              itemCount: ingredientes.length,
              itemBuilder: (ctx, index) => Row(
                children: [
                  Icon(
                    Icons.fiber_manual_record,
                    color: Colors.amber,
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      ingredientes[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
