import 'package:fixit_app/core/constants/constants.dart';
import 'package:fixit_app/features/home/data/home_cubit/home_cubit.dart';
import 'package:fixit_app/features/home/data/repositories/service_provider_repository.dart';
import 'package:fixit_app/features/home/presentation/widgets/service_providers_section.dart';
import 'package:fixit_app/features/home/presentation/widgets/title_section.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SizedBox(
          height: 40,
          width: 40,
          child: Image.asset('assets/images/logo.png'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xff0054A5)),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Image.asset(
                'assets/images/banar.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            TitleSection(
              title: S.of(context).popularServices,
              subtitle: S.of(context).viewAll,
              onPressed: () {
                // Handle view all button press
              },
            ),
            SizedBox(height: 80),
            TitleSection(
              title: S.of(context).serviceProviders,
              subtitle: S.of(context).viewAll,
              onPressed: () {
                // Handle view all button press
              },
            ),
            BlocProvider(
              create:
                  (context) => HomeCubit(
                    RepositoryProvider.of<ServiceProviderRepository>(context),
                  )..getHomeData(),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(
                      child: SpinKitFadingCube(
                        color: AppColor.kPrimaryColor,
                        size: 20.0,
                      ),
                    );
                  } else if (state is HomeLoaded) {
                    if (state.providers.isEmpty) {
                      return Center(
                        child: Text(S.current.noProvidersAvailable),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.85,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                        itemBuilder: (context, index) {
                          return ServiceProvidersSection(
                            provider: state.providers[index],
                          );
                        },
                      ),
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
