import 'package:comidinhas/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:comidinhas/widgets/loader.dart';
import 'package:comidinhas/widgets/receita_card.dart';

import 'search_viewmodel.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  int tabIndex = 0;

  void changeTabIndex(index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      onModelReady: (model) {
        model.searchReceitas("");
        model.searchPessoas("");
      },
      builder: (context, model, child) => DefaultTabController(
        length: 2,
        child: Builder(
          builder: (context) => Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(140),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: TextField(
                        onChanged: (value) {
                          if (tabIndex == 0) {
                            model.searchReceitas(value);
                          } else {
                            model.searchPessoas(value);
                          }
                        },
                        decoration: InputDecoration(
                          labelText:
                              'Pesquise por uma ${tabIndex == 0 ? "receita" : "pessoa"}',
                        ),
                      ),
                    ),
                    TabBar(
                      onTap: changeTabIndex,
                      tabs: [
                        Tab(text: "Receita"),
                        Tab(text: "Pessoas"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: model.isBusy
                ? Center(
                    child: Loader(
                      text:
                          'Buscando ${tabIndex == 0 ? "receitas" : "pessoas"}...',
                    ),
                  )
                : TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: model.receitas.length,
                        itemBuilder: (ctx, index) {
                          final receita = model.receitas[index];
                          return ReceitaCard(receita);
                        },
                      ),
                      ListView.builder(
                        itemCount: model.pessoas.length,
                        itemBuilder: (ctx, index) {
                          final pessoa = model.pessoas[index];
                          return UserCard(pessoa);
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
