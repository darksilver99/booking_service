import '/flutter_flow/flutter_flow_util.dart';
import 'approve_from_view_widget.dart' show ApproveFromViewWidget;
import 'package:flutter/material.dart';

class ApproveFromViewModel extends FlutterFlowModel<ApproveFromViewWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? isConfirm;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? isConfirm2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
