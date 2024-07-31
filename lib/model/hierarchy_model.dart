class HierarchyItem {
  final String name;
  final List<HierarchyItem> children;

  HierarchyItem({required this.name, required this.children});

  factory HierarchyItem.fromJson(Map<String, dynamic> json) {
    var childrenJson = json['children'] as List<dynamic>?;
    return HierarchyItem(
      name: json['name'],
      children: childrenJson != null
          ? childrenJson.map((child) => HierarchyItem.fromJson(child)).toList()
          : [],
    );
  }
}
