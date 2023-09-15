import 'package:cmms/common/constant/export.dart';
import 'package:cmms/feature/home_dashboard/screen/home.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, this.child = const HomeView()})
      : super(key: key);
  final Widget child;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  int? notification = 0;

  @override
  void initState() {
    super.initState();

    listWidget = [
      HomeView(),
      Container(),
      Container(),
      Container(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: listWidget.elementAt(_currentIndex),
        bottomNavigationBar: Container(
            height: 90,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 16,
                  offset: Offset(0, 2),
                  color: Color.fromRGBO(167, 115, 102, 0.16))
            ]),
            child: BottomNavigationBar(
                currentIndex: _currentIndex,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                unselectedFontSize: 10,
                selectedFontSize: 10,
                unselectedLabelStyle: h14(
                  context: context,
                  color: black,
                  fontWeight: '700',
                ),
                selectedLabelStyle:
                    h14(context: context, color: black, fontWeight: '700'),
                selectedItemColor: tiffanyBlue,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: _currentIndex == 0
                        ? const Icon(Icons.widgets)
                        : const Icon(Icons.widgets_outlined),
                    label: 'system.overview'.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: _currentIndex == 1
                        ? const Icon(Icons.speed)
                        : const Icon(Icons.speed_outlined),
                    label: 'cmms.meter'.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: _currentIndex == 2
                        ? const Icon(Icons.assignment)
                        : const Icon(Icons.assignment_outlined),
                    label: 'cmms.workOrder'.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: _currentIndex == 3
                        ? const Icon(Icons.work)
                        : const Icon(Icons.work_outline),
                    label: 'cmms.assets'.tr(),
                  ),
                ])));
  }
}
