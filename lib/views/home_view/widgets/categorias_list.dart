import 'package:comidinhas/views/home_view/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CategoriasList extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final cardBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    );

    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.categorias.length,
        itemBuilder: (ctx, index) {
          final categorias = viewModel.categorias[index];
          final color = categorias.color != null
              ? Color(categorias.color!)
              : Colors.white;

          return Container(
            width: 90,
            height: 100,
            child: Card(
              elevation: 2,
              shape: cardBorder,
              color: color,
              child: InkWell(
                customBorder: cardBorder,
                splashColor: color.withAlpha(230),
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(categorias.icon!),
                    Text(
                      "${categorias.descricao}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
