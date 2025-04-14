import 'dart:io';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial());

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(S.of(context).chosseCamera),
                onTap: () async {
                  Navigator.of(context).pop();
                  final status = await Permission.camera.request();
                  if (status.isGranted) {
                    final XFile? image = await _picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (image != null) {
                      emit(ProfileImageSelected(File(image.path)));
                    } else {
                      emit(ProfileImageInitial());
                    }
                  } else {
                    emit(ProfileImageError(S.of(context).cameraPermission));
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(S.of(context).chosseGallery),
                onTap: () async {
                  Navigator.of(context).pop();
                  final status = await Permission.photos.request();
                  if (status.isGranted) {
                    final XFile? image = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (image != null) {
                      emit(ProfileImageSelected(File(image.path)));
                    } else {
                      emit(ProfileImageInitial());
                    }
                  } else {
                    emit(ProfileImageError(S.of(context).galleryPermission));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
