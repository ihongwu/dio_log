import 'package:dio_log/bean/net_options.dart';
import 'package:dio_log/dio_log.dart';
import 'package:flutter/material.dart';

///网络请求详情
class LogWidget extends StatefulWidget {
  final NetOptions netOptions;

  LogWidget(this.netOptions);

  @override
  _LogWidgetState createState() => _LogWidgetState();
}

class _LogWidgetState extends State<LogWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "request"),
    new Tab(text: "response"),
  ];

  PageController? _pageController;

  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.netOptions.reqOptions!.url!,
          style: TextStyle(fontSize: 11, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return LogRequestWidget(widget.netOptions);
          } else if (index == 1) {
            return LogResponseWidget(widget.netOptions);
          } else {
            return LogErrorWidget(widget.netOptions);
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _bottomTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload_outlined, color: Colors.black), label: 'Request'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud_download_outlined, color: Colors.black), label: 'Response'),
          BottomNavigationBarItem(
              icon: Icon(Icons.error_outline, color: Colors.black), label: 'Error'),
        ],
      ),
    );
  }

  void _onPageChanged(int value) {
    if (mounted) {
      setState(() {
        currentIndex = value;
      });
    }
  }

  void _bottomTap(int value) {
    _pageController!.animateToPage(value,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
