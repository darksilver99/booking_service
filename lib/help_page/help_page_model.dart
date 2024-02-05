import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/information_dialog_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'help_page_widget.dart' show HelpPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HelpPageModel extends FlutterFlowModel<HelpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for topic widget.
  FocusNode? topicFocusNode;
  TextEditingController? topicController;
  String? Function(BuildContext, String?)? topicControllerValidator;
  String? _topicControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailController;
  String? Function(BuildContext, String?)? detailControllerValidator;
  String? _detailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for contactName widget.
  FocusNode? contactNameFocusNode;
  TextEditingController? contactNameController;
  String? Function(BuildContext, String?)? contactNameControllerValidator;
  String? _contactNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for contactPhone widget.
  FocusNode? contactPhoneFocusNode;
  TextEditingController? contactPhoneController;
  String? Function(BuildContext, String?)? contactPhoneControllerValidator;
  String? _contactPhoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for contactEmail widget.
  FocusNode? contactEmailFocusNode;
  TextEditingController? contactEmailController;
  String? Function(BuildContext, String?)? contactEmailControllerValidator;
  String? _contactEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topicControllerValidator = _topicControllerValidator;
    detailControllerValidator = _detailControllerValidator;
    contactNameControllerValidator = _contactNameControllerValidator;
    contactPhoneControllerValidator = _contactPhoneControllerValidator;
    contactEmailControllerValidator = _contactEmailControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    topicFocusNode?.dispose();
    topicController?.dispose();

    detailFocusNode?.dispose();
    detailController?.dispose();

    contactNameFocusNode?.dispose();
    contactNameController?.dispose();

    contactPhoneFocusNode?.dispose();
    contactPhoneController?.dispose();

    contactEmailFocusNode?.dispose();
    contactEmailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
