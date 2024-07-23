import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/widget/color.dart';

void showDraggableBottomSheet(BuildContext context, String name, String course, String sem, int phone, int age, String address, String image) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 0.95,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 55, 61, 66),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: FileImage(File(image)),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        name.toUpperCase(),
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: CustomColor.getColor()),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow('Course', course),
                        _buildInfoRow('Semester', sem),
                        _buildInfoRow('Phone', phone.toString()),
                        _buildInfoRow('Age', age.toString()),
                        _buildInfoRow('Address', address),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            '$label:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColor.getColor()),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 16, color: CustomColor.getColor()),
          ),
        ),
      ],
    ),
  );
}