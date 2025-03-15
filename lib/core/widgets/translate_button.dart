import 'package:fixit_app/app.dart';
import 'package:fixit_app/core/widgets/custom_button.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';

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
                      FixitApp.setLocale(context, const Locale('en'));
                      Navigator.pop(context);
                    },
                    color: Color(0xff0054A5),
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  customButton(
                    title: S.of(context).arabic,
                    onTap: () {
                      FixitApp.setLocale(context, const Locale('ar'));
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                    textColor: Color(0xff0054A5),
                    borderColor: Color(0xff0054A5),
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
