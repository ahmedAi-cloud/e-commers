import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../localization/app_localizations.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title:  Text(t.translate("My_Cart")),
        centerTitle: true,
      ),
      body: cart.items.isEmpty
          ? Center(
              child: Text(
                t.translate("Cart_is_empty"),
                style: const TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, i) {
                final item = cart.items[i];

                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    leading: Image.network(
                      item.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.title),
                    subtitle: Text("EGP ${item.price}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        cart.removeFromCart(item);
                      },
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.items.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("${t.translate("Checkout")}  (EGP ${cart.totalPrice})"),
              ),
            ),
    );
  }
}
