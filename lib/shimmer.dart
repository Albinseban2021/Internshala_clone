import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 20, width: double.infinity, color: Colors.white),
              SizedBox(height: 10),
              Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.white),
              SizedBox(height: 10),
              Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width / 4,
                  color: Colors.white),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width / 3,
                      color: Colors.white),
                  Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width / 4,
                      color: Colors.white),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}