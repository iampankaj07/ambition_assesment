import 'package:ambitionguru_task/model/hierarchy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

// Your model class

class HierarchyProvider extends ChangeNotifier {
  List<HierarchyItem> hierarchy = [];
  String hierarchyPath = '';

  HierarchyProvider() {
    loadHierarchy();
  }

  Future<void> loadHierarchy() async {
    // Load the JSON file from assets
    String jsonString = await rootBundle.loadString('assets/hierarchy.json');
    var jsonData = json.decode(jsonString);
    hierarchy = (jsonData['items'] as List<dynamic>)
        .map((item) => HierarchyItem.fromJson(item))
        .toList();
  }

  void findHierarchyPath(String id) {
    hierarchyPath = _findPath(hierarchy, id) ?? 'Hierarchy not found';
    notifyListeners();
  }

  String? _findPath(List<HierarchyItem> items, String name, [String? path]) {
    for (var item in items) {
      var currentPath = path == null ? item.name : '$path > ${item.name}';
      if (item.name == name) {
        return currentPath;
      }
      var childPath = _findPath(item.children, name, currentPath);
      if (childPath != null) {
        return childPath;
      }
    }
    return null;
  }
}
