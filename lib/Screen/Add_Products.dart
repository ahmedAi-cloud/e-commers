import 'package:flutter/material.dart';
import '../services/product_service.dart';

class CreateProductPage extends StatefulWidget {
  @override
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final id = TextEditingController();
  final title = TextEditingController();
  final price = TextEditingController();
  final desc = TextEditingController();
  final category = TextEditingController();
  final image = TextEditingController();

  final api = AppAPIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Product"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildField("ID", id, TextInputType.number),
            buildField("Title", title, TextInputType.text),
            buildField("Price", price, TextInputType.number),
            buildField("Description", desc, TextInputType.multiline, maxLines: 3),
            buildField("Category", category, TextInputType.text),
            buildField("Image URL", image, TextInputType.url),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final product = {
                  "id": int.tryParse(id.text) ?? 0,
                  "title": title.text,
                  "price": double.tryParse(price.text) ?? 0.0,
                  "description": desc.text,
                  "category": category.text,
                  "image": image.text,
                };

                final ok = await api.createProduct(product);

                if (ok) {
                  Navigator.pop(context, product);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to create product")),
                  );
                }
              },
              child: Text("Create Product"),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildField(
    String label,
    TextEditingController controller,
    TextInputType type, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: type,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
