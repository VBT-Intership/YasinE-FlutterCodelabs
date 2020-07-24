import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdc101/models/product.dart';
import 'package:mdc101/models/products_repository.dart';
import 'package:mdc101/supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        elevation: 50.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product == null ? '' : product.name,
                      style: theme.textTheme.button,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      product == null ? '' : formatter.format(product.price),
                      style: theme.textTheme.caption,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(),
      body:AsymmetricView(products: ProductsRepository.loadProducts(Category.all)),
      /* GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(8.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),*/
      bottomNavigationBar: buildBottomAppBar(),
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      brightness: Brightness.dark,
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: "search",
          ),
          onPressed: () {
            print("search button clicked");
          },
        ),
        IconButton(
          icon: Icon(
            Icons.tune,
            semanticLabel: "filter",
          ),
          onPressed: () {
            print("filter button clicked");
          },
        ),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          semanticLabel: "menu",
        ),
        onPressed: () {
          print("menu");
        },
      ),
      title: Text("HomePage"),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(
        height: 50.0,
      ),
    );
  }
}
//My first buildGridCards
/*
  List<Card>  _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
      (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset('assets/diamond.png'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  SizedBox(height: 8.0),
                  Text("Secondary Text"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return cards;
  }
*/
