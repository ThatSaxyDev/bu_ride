import 'package:flutter/material.dart';
// import 'package:universal_html/html.dart' as html;

class EmptyView extends StatefulWidget {
  const EmptyView({super.key});

  @override
  State<EmptyView> createState() => _EmptyViewState();
}

class _EmptyViewState extends State<EmptyView> {
  @override
  void initState() {
    super.initState();
    // html.window.location.reload();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('...'),
      ),
    );
  }
}
