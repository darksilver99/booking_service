import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/information_dialog_view_widget.dart';
import '/components/no_data_view_widget.dart';
import '/components/rating_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'service_near_me_list_page_widget.dart' show ServiceNearMeListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ServiceNearMeListPageModel
    extends FlutterFlowModel<ServiceNearMeListPageWidget> {
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
  // Stores action output result for [Firestore Query - Query a collection] action in ServiceNearMeListPage widget.
  List<ServiceListRecord>? serviceTmpList;
  // Stores action output result for [Custom Action - getServiceDistance] action in ServiceNearMeListPage widget.
  List<ServiceListRecord>? serviceAfterGetDistanceList;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in ServiceNearMeListPage widget.
  bool? isOK;
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
