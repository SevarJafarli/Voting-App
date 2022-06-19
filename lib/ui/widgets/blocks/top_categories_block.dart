import 'package:flutter/material.dart';
import 'package:voting_app_demo/models/responses/category_response.dart';
import 'package:voting_app_demo/ui/widgets/blocks/app_block.dart';
import 'package:voting_app_demo/ui/widgets/buttons/category_button.dart';

class TopCategoriesBlock extends AppBlock {
  final List<CategoryResponse> topCategories = List.generate(5, (index) => CategoryResponse(id: index, name: "Category $index"));

  @override
  Widget buildContent() {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: [
        for (var button in topCategories) CategoryButton(text: button.name ?? "", ),
      ],
    );
  }

  @override
  void onTap() {
    // TODO: implement onTap
  }

  @override
  String title() {
    return "Top Categories";
  }
}
