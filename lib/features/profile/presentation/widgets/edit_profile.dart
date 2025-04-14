import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit_app/core/constants/constants.dart';
import 'package:fixit_app/core/constants/countries.dart';
import 'package:fixit_app/core/widgets/custom_button.dart';
import 'package:fixit_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:fixit_app/features/profile/data/profile_cubit/profile_cubit.dart';
import 'package:fixit_app/features/profile/data/profile_image_cubit/profile_image_cubit.dart';
import 'package:fixit_app/features/profile/data/repository/user_repo_get.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  String? selectedCountry;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          S.of(context).editProfile,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColor.kPrimaryColor,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    ProfileCubit(RepositoryProvider.of<UserRepo>(context))
                      ..getUserData(),
          ),
          BlocProvider(create: (_) => ProfileImageCubit()),
        ],
        child: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileUpdated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).updataData),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is ProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(
                  child: SpinKitFadingCube(
                    color: AppColor.kPrimaryColor,
                    size: 25.0,
                  ),
                );
              } else if (state is ProfileLoaded || state is ProfileUpdated) {
                final user =
                    state is ProfileLoaded
                        ? state.users.first
                        : (state as ProfileUpdated).user;

                nameController.text = user.name;
                emailController.text = user.email;
                selectedCountry ??= user.country;

                return BlocBuilder<ProfileImageCubit, ProfileImageState>(
                  builder: (context, imageState) {
                    ImageProvider imageProvider;

                    if (imageState is ProfileImageSelected) {
                      imageProvider = FileImage(imageState.image);
                    } else {
                      imageProvider = CachedNetworkImageProvider(
                        user.image ?? '',
                      );
                    }

                    return SingleChildScrollView(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 52.r,
                                    backgroundImage: imageProvider,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        context
                                            .read<ProfileImageCubit>()
                                            .pickImage(context);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: AppColor.kPrimaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        padding: const EdgeInsets.all(6),
                                        child: const Icon(
                                          Icons.edit,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          CustomTextField(
                            controller: nameController,
                            label: S.of(context).fullName,
                            hint: S.of(context).enterYourFullName,
                            icon: Icons.person_outline,
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: 16.h),
                          CustomTextField(
                            controller: emailController,
                            label: S.of(context).email,
                            hint: S.of(context).enterYourEmail,
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 16.h),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return ListView(
                                    padding: EdgeInsets.all(16.w),
                                    children:
                                        countries.map((country) {
                                          return ListTile(
                                            title: Text(country),
                                            onTap: () {
                                              setState(() {
                                                selectedCountry = country;
                                              });
                                              Navigator.pop(context);
                                            },
                                          );
                                        }).toList(),
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(selectedCountry ?? 'اختر الدولة'),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          customButton(
                            title: S.of(context).saveDate,
                            onTap: () {
                              final updatedData = {
                                'name': nameController.text.trim(),
                                'email': emailController.text.trim(),
                                'country': selectedCountry,
                              };
                              context.read<ProfileCubit>().updateUserData(
                                user.id!,
                                updatedData,
                              );
                            },
                            color: AppColor.kPrimaryColor,
                            textColor: Colors.white,
                            size: 60,
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is ProfileError) {
                return Center(child: Text(state.errorMessage));
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
