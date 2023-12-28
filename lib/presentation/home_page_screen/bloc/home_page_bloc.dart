import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/newreleaseslist_item_model.dart';
import 'package:vishwas_s_application1/presentation/home_page_screen/models/home_page_model.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

/// A bloc that manages the state of a HomePage according to the event that is dispatched to it.
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(HomePageState initialState) : super(initialState) {
    on<HomePageInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomePageInitialEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(state.copyWith(
        homePageModelObj: state.homePageModelObj?.copyWith(
            newreleaseslistItemList: fillNewreleaseslistItemList())));
  }

  List<NewreleaseslistItemModel> fillNewreleaseslistItemList() {
    return [
      NewreleaseslistItemModel(
          urgentSiege: ImageConstant.imgThumbnails,
          urgentSiege1: "Urgent Siege",
          damnedAnthem: "Damned Anthem"),
      NewreleaseslistItemModel(
          urgentSiege: ImageConstant.imgThumbnails181x159,
          urgentSiege1: "Urgent Siege",
          damnedAnthem: "Damned Anthem")
    ];
  }
}
