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
            SizedBox(height: 10),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ingredientes.length,
              itemBuilder: (ctx, index) => ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 0,
                horizontalTitleGap: 10,
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.amber,
                ),
                title: Text(
                  ingredientes[index],
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
