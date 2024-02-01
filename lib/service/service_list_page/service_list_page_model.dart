import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'service_list_page_widget.dart' show ServiceListPageWidget;
import 'package:flutter/material.dart';

class ServiceListPageModel extends FlutterFlowModel<ServiceListPageWidget> {
  ///  Local state fields for this page.

  List<ServiceListRecord> serviceList = [];
  void addToServiceList(ServiceListRecord item) => serviceList.add(item);
  void removeFromServiceList(ServiceListRecord item) =>
      serviceList.remove(item);
  void removeAtIndexFromServiceList(int index) => serviceList.removeAt(index);
  void insertAtIndexInServiceList(int index, ServiceListRecord item) =>
      serviceList.insert(index, item);
  void updateServiceListAtIndex(
          int index, Function(ServiceListRecord) updateFn) =>
      serviceList[index] = updateFn(serviceList[index]);

  bool isLoading = true;

  List<ServiceListRecord> serviceSearchedList = [];
  void addToServiceSearchedList(ServiceListRecord item) =>
      serviceSearchedList.add(item);
  void removeFromServiceSearchedList(ServiceListRecord item) =>
      serviceSearchedList.remove(item);
  void removeAtIndexFromServiceSearchedList(int index) =>
      serviceSearchedList.removeAt(index);
  void insertAtIndexInServiceSearchedList(int index, ServiceListRecord item) =>
      serviceSearchedList.insert(index, item);
  void updateServiceSearchedListAtIndex(
          int index, Function(ServiceListRecord) updateFn) =>
      serviceSearchedList[index] = updateFn(serviceSearchedList[index]);

  bool isSearched = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ServiceListPage widget.
  List<ServiceListRecord>? serviceTmpList;
  // Stores action output result for [Custom Action - getServiceDistance] action in ServiceListPage widget.
  List<ServiceListRecord>? serviceAfterGetDistanceList;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in ServiceListPage widget.
  bool? isOK;
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
