import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/ui/app/widgets/widgets.dart';
import 'package:admin_panel/ui/product_details/widgets/resources_list/resource_item.dart';
import 'package:admin_panel/ui/product_details/widgets/resources_list/resource_list_header.dart';
import 'package:flutter/material.dart';

class ResourcesListContent extends StatelessWidget {
  const ResourcesListContent({required this.resources, Key? key})
      : super(key: key);

  final List<Resource> resources;

  Widget _resourceToWidget(Resource r) => ResourcesListItemContent(resource: r);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ResourcesListHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Column(children: [
                ...resources
                    .map((Resource p) => GestureDetector(
                        child: CustomListItem(content: _resourceToWidget(p))))
                    .toList(),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
