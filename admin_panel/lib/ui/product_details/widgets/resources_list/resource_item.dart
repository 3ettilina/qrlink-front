import 'package:admin_panel/domain/models/models.dart';
import 'package:flutter/material.dart';

class ResourcesListItemContent extends StatelessWidget {
  const ResourcesListItemContent({required this.resource, Key? key})
      : super(key: key);

  final Resource resource;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(flex: 3, child: Text('# ${resource.name}')),
        Expanded(child: Text(resource.language ?? '')),
        Expanded(flex: 2, child: Text(resource.linkType ?? '')),
        Expanded(flex: 3, child: Text(resource.resourceUrl)),
      ],
    );
  }
}
