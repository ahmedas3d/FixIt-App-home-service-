import 'package:dio/dio.dart';
import 'package:fixit_app/Models/service_provider_model.dart';
import 'package:fixit_app/core/constants/constants.dart';
import 'package:fixit_app/features/ServiceProvider/presentation/widgets/custom_service_providers.dart';
import 'package:fixit_app/features/home/data/repositories/service_provider_repository.dart';
import 'package:fixit_app/features/home/presentation/widgets/title_section.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ServiceProviderScreen extends StatelessWidget {
  const ServiceProviderScreen({super.key});

  Future<List<User>> fetchProviders() async {
    final repo = ServiceProviderRepository(Dio());
    return await repo.getServiceProviders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          S.of(context).serviceProvider,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColor.kPrimaryColor,
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, bottom: 18),
        child: FutureBuilder<List<User>>(
          future: fetchProviders(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitFadingCube(
                  color: AppColor.kPrimaryColor,
                  size: 25.0,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('خطأ: ${snapshot.error}'));
            }

            final allProviders = snapshot.data ?? [];

            return ListView(
              children: [
                TitleSection(title: S.of(context).electricianProviders),
                SizedBox(
                  height: 190.h,
                  child: CustomServiceProviders(
                    allProviders: allProviders,
                    specialty: "Electrician", // حدد التخصص
                    onTap: (provider) {
                      print("تم اختيار: ${provider.name}");
                    },
                  ),
                ),
                TitleSection(title: S.of(context).plumberProviders),
                SizedBox(
                  height: 190.h,
                  child: CustomServiceProviders(
                    allProviders: allProviders,
                    specialty: "Plumber", // حدد التخصص
                    onTap: (provider) {
                      print("تم اختيار: ${provider.name}");
                    },
                  ),
                ),
                TitleSection(title: S.of(context).carpenterProviders),
                SizedBox(
                  height: 190.h,
                  child: CustomServiceProviders(
                    allProviders: allProviders,
                    specialty: "Carpenter", // حدد التخصص
                    onTap: (provider) {
                      print("تم اختيار: ${provider.name}");
                    },
                  ),
                ),
                TitleSection(title: S.of(context).cleanerProviders),
                SizedBox(
                  height: 190.h,
                  child: CustomServiceProviders(
                    allProviders: allProviders,
                    specialty: "Cleaner", // حدد التخصص
                    onTap: (provider) {
                      print("تم اختيار: ${provider.name}");
                    },
                  ),
                ),
                TitleSection(title: S.of(context).painterProviders),
                SizedBox(
                  height: 190.h,
                  child: CustomServiceProviders(
                    allProviders: allProviders,
                    specialty: "Painter", // حدد التخصص
                    onTap: (provider) {
                      print("تم اختيار: ${provider.name}");
                    },
                  ),
                ),
                TitleSection(title: S.of(context).moverProviders),
                SizedBox(
                  height: 190.h,
                  child: CustomServiceProviders(
                    allProviders: allProviders,
                    specialty: "Mover", // حدد التخصص
                    onTap: (provider) {
                      print("تم اختيار: ${provider.name}");
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
