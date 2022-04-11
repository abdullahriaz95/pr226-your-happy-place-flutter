import 'package:flutter/material.dart';

class ProgressDialogLayout extends StatelessWidget {
  const ProgressDialogLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _getLoadingIndicator(),
          const SizedBox(width: 16),
          _getHeading(),
        ],
      ),
    );
  }

  Widget _getLoadingIndicator() {
    return const Padding(
      child: SizedBox(
          child: CircularProgressIndicator(strokeWidth: 3),
          width: 32,
          height: 32),
      padding: EdgeInsets.only(bottom: 16),
    );
  }

  Widget _getHeading() {
    return const Padding(
      child: Text(
        'Please wait …',
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.only(bottom: 4),
    );
  }
}
