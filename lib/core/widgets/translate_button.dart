import 'package:fixit_app/core/utils/service/language_cubit/language_cubit.dart';
import 'package:fixit_app/core/widgets/custom_button.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranslateButton extends StatelessWidget {
  const TranslateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.language, color: Color(0xff0054A5)),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          backgroundColor: Colors.white,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  customButton(
                    title: S.of(context).english,
                    onTap: () {
                      context.read<LanguageCubit>().changeLanguage(
                        const Locale('en'),
                      );
                      Navigator.pop(context);
                    },
                    color: const Color(0xff0054A5),
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  customButton(
                    title: S.of(context).arabic,
                    onTap: () {
                      context.read<LanguageCubit>().changeLanguage(
                        const Locale('ar'),
                      );
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                    textColor: const Color(0xff0054A5),
                    borderColor: const Color(0xff0054A5),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
