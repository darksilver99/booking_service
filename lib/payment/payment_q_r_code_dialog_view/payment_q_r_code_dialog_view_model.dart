import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/information_dialog_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'payment_q_r_code_dialog_view_widget.dart'
    show PaymentQRCodeDialogViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PaymentQRCodeDialogViewModel
    extends FlutterFlowModel<PaymentQRCodeDialogViewWidget> {
  ///  Local state fields for this component.

  String? url;

  DocumentReference? paymentRef;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in PaymentQRCodeDialogView widget.
  PaymentHistoryListRecord? tmpPaymentRef;
  // Stores action output result for [Custom Action - setQRCodePayment] action in PaymentQRCodeDialogView widget.
  String? rsURL;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
