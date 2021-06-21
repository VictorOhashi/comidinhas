import 'package:comidinhas/utils/parse_avaliacao.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../profile_viewmodel.dart';

class ProfileInfo extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    final avaliacao = getAvaliacao(viewModel.currentUser.avaliacoes);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.black87, width: 2),
            ),
            clipBehavior: Clip.antiAlias,
            child: viewModel.currentUser.image == null
                ? Icon(Icons.person)
                : Image.network(
                    viewModel.currentUser.image!,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(width: 15),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(viewModel.currentUser.nome!),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                        children: [
                          TextSpan(
                            text: "$avaliacao ",
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${viewModel.currentUser.descricao!}',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
