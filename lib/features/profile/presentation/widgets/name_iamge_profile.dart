import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit_app/core/constants/constants.dart';
import 'package:fixit_app/features/profile/data/profile_cubit/profile_cubit.dart';
import 'package:fixit_app/features/profile/data/repository/user_repo_get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NameAndImageProfile extends StatelessWidget {
  const NameAndImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProfileCubit(RepositoryProvider.of<UserRepo>(context))
                ..getUserData(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: SpinKitFadingCube(
                color: AppColor.kPrimaryColor,
                size: 25.0,
              ),
            );
          } else if (state is ProfileLoaded) {
            final user = state.users.first; // 👈 كده بتاخد أول مستخد
            return Column(
              children: [
                CircleAvatar(
                  radius: 52.r,
                  backgroundImage: CachedNetworkImageProvider(user.image!),
                ),
                const SizedBox(height: 10),
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          } else if (state is ProfileError) {
            return Center(child: Text(state.errorMessage));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
