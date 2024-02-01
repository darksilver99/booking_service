import '/flutter_flow/flutter_flow_util.dart';
import 'service_detail_page_widget.dart' show ServiceDetailPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ServiceDetailPageModel extends FlutterFlowModel<ServiceDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  DateTime? datePicked;
  // Stores action output result for [Bottom Sheet - RemarkFormView] action in Button widget.
  String? remarkText;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
