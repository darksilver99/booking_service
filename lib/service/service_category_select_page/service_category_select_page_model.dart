import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'service_category_select_page_widget.dart'
    show ServiceCategorySelectPageWidget;
import 'package:flutter/material.dart';

class ServiceCategorySelectPageModel
    extends FlutterFlowModel<ServiceCategorySelectPageWidget> {
  ///  Local state fields for this page.

  List<CategoryListRecord> categoryList = [];
  void addToCategoryList(CategoryListRecord item) => categoryList.add(item);
  void removeFromCategoryList(CategoryListRecord item) =>
      categoryList.remove(item);
  void removeAtIndexFromCategoryList(int index) => categoryList.removeAt(index);
  void insertAtIndexInCategoryList(int index, CategoryListRecord item) =>
      categoryList.insert(index, item);
  void updateCategoryListAtIndex(
          int index, Function(CategoryListRecord) updateFn) =>
      categoryList[index] = updateFn(categoryList[index]);

  List<CategoryListRecord> categorySearchedList = [];
  void addToCategorySearchedList(CategoryListRecord item) =>
      categorySearchedList.add(item);
  void removeFromCategorySearchedList(CategoryListRecord item) =>
      categorySearchedList.remove(item);
  void removeAtIndexFromCategorySearchedList(int index) =>
      categorySearchedList.removeAt(index);
  void insertAtIndexInCategorySearchedList(
          int index, CategoryListRecord item) =>
      categorySearchedList.insert(index, item);
  void updateCategorySearchedListAtIndex(
          int index, Function(CategoryListRecord) updateFn) =>
      categorySearchedList[index] = updateFn(categorySearchedList[index]);

  bool isLoading = true;

  bool isSearched = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ServiceCategorySelectPage widget.
  List<CategoryListRecord>? rsList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
