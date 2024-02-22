// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bu_ride/models/driver_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardStateNotifier extends Notifier<DashboardState> {
  @override
  DashboardState build() {
    return const DashboardState();
  }

  void expandSideNav() {
    state = state.copyWith(isSideNavExpanded: true);
  }

  void collapseSideNav() {
    state = state.copyWith(isSideNavExpanded: false);
  }

  void toggleSideNav() {
    state = state.copyWith(isSideNavExpanded: !state.isSideNavExpanded);
  }

  void switchToPageIndex(int newIndex) {
    state = state.copyWith(pageIndex: newIndex);
  }

  void switchToEditDriver() {
    switchToPageIndex(5);
  }
}

class DashboardState {
  final bool isSideNavExpanded;
  final int pageIndex;

  const DashboardState({this.isSideNavExpanded = true, this.pageIndex = 0});

  DashboardState copyWith({
    bool? isSideNavExpanded,
    int? pageIndex,
  }) {
    return DashboardState(
      isSideNavExpanded: isSideNavExpanded ?? this.isSideNavExpanded,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
