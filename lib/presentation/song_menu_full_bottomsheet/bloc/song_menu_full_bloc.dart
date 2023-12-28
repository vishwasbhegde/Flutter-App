import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/options_item_model.dart';
import 'package:vishwas_s_application1/presentation/song_menu_full_bottomsheet/models/song_menu_full_model.dart';
part 'song_menu_full_event.dart';
part 'song_menu_full_state.dart';

/// A bloc that manages the state of a SongMenuFull according to the event that is dispatched to it.
class SongMenuFullBloc extends Bloc<SongMenuFullEvent, SongMenuFullState> {
  SongMenuFullBloc(SongMenuFullState initialState) : super(initialState) {
    on<SongMenuFullInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SongMenuFullInitialEvent event,
    Emitter<SongMenuFullState> emit,
  ) async {
    emit(state.copyWith(
        songMenuFullModelObj: state.songMenuFullModelObj?.copyWith(
      optionsItemList: fillOptionsItemList(),
    )));
  }

  List<OptionsItemModel> fillOptionsItemList() {
    return [
      OptionsItemModel(
          addtoPlaylist: ImageConstant.imgPlus,
          addToPlaylist: "Add to Playlist"),
      OptionsItemModel(
          addtoPlaylist: ImageConstant.imgUser, addToPlaylist: "Artist"),
      OptionsItemModel(
          addtoPlaylist: ImageConstant.imgIcons, addToPlaylist: "Album"),
      OptionsItemModel(
          addtoPlaylist: ImageConstant.imgIconsOnprimarycontainer,
          addToPlaylist: "I don’t like it"),
      OptionsItemModel(
          addtoPlaylist: ImageConstant.imgFile, addToPlaylist: "Song lyrics"),
      OptionsItemModel(
          addtoPlaylist: ImageConstant.imgDownload, addToPlaylist: "Download")
    ];
  }
}
