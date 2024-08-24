import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_view_model.dart';
import '../widgets/product_item.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products' , style: TextStyle(fontSize: 28),),
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, productViewModel, child) {
          if (productViewModel.isLoading) {
            return Center(child: CircularProgressIndicator(color: Colors.black,));
          }

          return  productViewModel.products.length ==0 ?Center(child: Container(height: 200,color: Colors.tealAccent,)):ListView.builder(
            itemCount: productViewModel.products.length,
            itemBuilder: (context, index) {
              final product = productViewModel.products[index];
              return ProductItem(product: product);
            },
          );
        },
      ),
    );
  }
}
