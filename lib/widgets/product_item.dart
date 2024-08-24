import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../view/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    double discountedPrice = product.price * (1 - (product.discountPercentage / 100));

    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailScreen(product: product)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300), // Adding border
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        // color: Colors.blue,
                        child: CachedNetworkImage(
                          // width: 100,
                          // height: 100,
                          fit: BoxFit.cover, imageUrl: product.thumbnail,
                          placeholder: (context, url) => Container(color: Colors.white60,),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '-${product.discountPercentage.toStringAsFixed(0)}%',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: Image.network(
            //     product.imageUrl,
            //     width: 100,
            //     height: 100,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Expanded(
              flex: 3, // Adjust flex to control the width

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        product.rating.round(),
                        (index) => Icon(Icons.star, color: Colors.orange, size: 16),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      product.brand,
                      style: const TextStyle(
                        color: Color.fromRGBO(155, 155, 155, 1),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color.fromRGBO(34, 34, 34, 1),
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '\$${discountedPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                        //   decoration: BoxDecoration(
                        //     color: Colors.redAccent,
                        //     borderRadius: BorderRadius.circular(5),
                        //   ),
                        //   child: Text(
                        //     '-${product.discountPercentage.toStringAsFixed(0)}%',
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
