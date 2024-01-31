import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/information_dialog_view_widget.dart';
import '/components/rating_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'booking_list_page_widget.dart' show BookingListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BookingListPageModel extends FlutterFlowModel<BookingListPageWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in BookingListPage widget.
  List<ServiceListRecord>? serviceTmpList;
  // Stores action output result for [Custom Action - getServiceDistance] action in BookingListPage widget.
  List<ServiceListRecord>? serviceAfterGetDistanceList;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in BookingListPage widget.
  bool? isOK;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
