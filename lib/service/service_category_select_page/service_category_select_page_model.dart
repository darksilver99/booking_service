import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'service_category_select_page_widget.dart'
    show ServiceCategorySelectPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ServiceCategorySelectPage widget.
  List<CategoryListRecord>? rsList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
