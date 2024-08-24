import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    double discountedPrice = product.price * (1 - (product.discountPercentage / 100));

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button action
          },
        ),
        title: Text(
          product.category,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Handle share button action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Container(
                      color: Colors.black12,
                      child: CachedNetworkImage(
                       imageUrl:  product.imageUrl[0],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 420,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.favorite_border, color: Colors.red),
                          onPressed: () {
                            // Handle favorite button action
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Product Details
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
        
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              SizedBox(height: 0),
                              Text(
                                product.brand,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: List.generate(
                                      product.rating.round(),
                                          (index) => Icon(Icons.star, color: Colors.orange, size: 16),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    product.rating.toString(),
                                    style: TextStyle(fontSize: 16, color: Colors.black87),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '(10)',
                                    style: TextStyle(fontSize: 16, color: Colors.black87),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Price
                        Text(
                          '\$${discountedPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Product Description
                    Text(
                      product.description,
                      style: TextStyle(fontSize: 18, color: Colors.grey[800]),
        
                    ),
                    SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.all( 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {
                          // Handle add to cart action
                        },
                        child: Center(
                          child: const Text(
                            'ADD TO CART',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              // Add to Cart Button
        
            ],
          ),
        ),
      ),
    );
  }
}
