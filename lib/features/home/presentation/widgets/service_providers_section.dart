import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit_app/core/constants/constants.dart';
import 'package:fixit_app/features/home/presentation/widgets/custom_button_home.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:fixit_app/Models/service_provider_model.dart';

class ServiceProvidersSection extends StatelessWidget {
  final ServiceProvider provider;

  const ServiceProvidersSection({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!, width: 1.5),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: provider.image!,
              placeholder:
                  (context, url) =>
                      const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 130,
            ),
            const SizedBox(height: 8),
            Text(
              provider.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              provider.specialty,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: AppColor.kPrimaryColor, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      provider.rating.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                CustomButtonHome(
                  title: S.of(context).details,
                  onTap: () {},
                  color: AppColor.kPrimaryColor,
                  textColor: Colors.white,
                  size: 30,
                  withSize: 100,
                ),
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
