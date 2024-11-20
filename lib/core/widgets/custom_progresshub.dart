import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomProgressHub extends StatelessWidget {
  const CustomProgressHub({
    super.key, required this.child,required this.isLoading
  });
  final Widget child;
  final bool isLoading ;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: isLoading,
        child: child);
  }
}