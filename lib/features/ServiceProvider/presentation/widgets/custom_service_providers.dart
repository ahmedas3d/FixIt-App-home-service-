import 'package:fixit_app/Models/service_provider_model.dart';
import 'package:fixit_app/features/ServiceProvider/presentation/widgets/services_card.dart';
import 'package:flutter/material.dart';

class CustomServiceProviders extends StatelessWidget {
  final List<User> allProviders;
  final String specialty;
  final void Function(User) onTap;

  const CustomServiceProviders({
    super.key,
    required this.allProviders,
    required this.specialty,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final filtered =
        allProviders.where((e) => e.specialty == specialty).toList();

    if (filtered.isEmpty) {
      return const Center(child: Text('لا يوجد مزودي خدمة لهذا التخصص'));
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final provider = filtered[index];
        return SizedBox(
          width: 185,
          child: ServiceCard(provider: provider, onTap: () => onTap(provider)),
        );
      },
    );
  }
}
