import 'package:flutter/material.dart';

class ModoPreparoCard extends StatelessWidget {
  final List<String> modoPreparo;

  const ModoPreparoCard({
    Key? key,
    required this.modoPreparo,
  }) : super(key: key);

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
              'Modo de preparo:',
              style: Theme.of(context).textTheme.headline3,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: modoPreparo.length,
              itemBuilder: (ctx, index) => ListTile(
                contentPadding: EdgeInsets.all(0),
                horizontalTitleGap: 10,
                leading: Container(
                  width: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${index + 1}'),
                      VerticalDivider(
                        thickness: 5,
                        endIndent: 5,
                        indent: 5,
                        color: Color(0xFFCEF7D7),
                      )
                    ],
                  ),
                ),
                title: Text(
                  modoPreparo[index],
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
