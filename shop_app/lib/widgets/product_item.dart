import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Product>(
      builder: (context, product, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductDetailScreen.routeName, arguments: product.id);
            },
            child: GridTile(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: IconButton(
                  icon: product.isFavorite ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border),
                  onPressed: () {
                    product.toggleFavoriteStatus();
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
