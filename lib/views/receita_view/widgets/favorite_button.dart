import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../receita_viewmodel.dart';

class FavoriteButton extends ViewModelWidget<ReceitaViewModel> {
  final String documentId;

  FavoriteButton(this.documentId);

  @override
  Widget build(BuildContext context, ReceitaViewModel viewModel) {
    return Container(
      width: 56,
      child: InkWell(
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Color(0xCCFFFFFF),
          ),
          child: Icon(
            viewModel.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: viewModel.isFavorite ? Colors.red : Colors.black87,
          ),
        ),
        onTap: () => viewModel.favoriteReceita(documentId),
      ),
    );
  }
}
