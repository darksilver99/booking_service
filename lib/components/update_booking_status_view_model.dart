import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/confirm_cancel_dialog_view_widget.dart';
import '/components/confirm_dialog_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'update_booking_status_view_widget.dart'
    show UpdateBookingStatusViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateBookingStatusViewModel
    extends FlutterFlowModel<UpdateBookingStatusViewWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? isConfirm;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? isConfirm3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
