import 'package:ecommerce_app/Screen/login_page.dart';
import 'package:ecommerce_app/services/auth_firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../localization/app_localizations.dart';
import '../localization/local_provider.dart';
import '../theme/theme_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.translate("profile"),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://www.w3schools.com/howto/img_avatar.png",
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Ahmed",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "ahmed@example.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // -------------------------------
            // تغيير اللغة Language
            // -------------------------------
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(t.translate("change_language")),
              trailing: DropdownButton<String>(
                value: localeProvider.locale.languageCode,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(
                    value: "en",
                    child: Text("English"),
                  ),
                  DropdownMenuItem(
                    value: "ar",
                    child: Text("العربية"),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    localeProvider.changeLanguage(value);
                  }
                },
              ),
            ),

            // -------------------------------
            // تغيير الثيم (Dark / Light)
            // -------------------------------
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: Text(t.translate("theme_mode")),
              value: themeProvider.isDark,
              onChanged: (_) => themeProvider.toggleTheme(),
            ),

            const SizedBox(height: 10),

            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(t.translate("settings")),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.lock),
              title: Text(t.translate("privacy")),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(t.translate("logout")),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async{
                await AuthFirebaseServices().logout();
                Navigator.pop(context,MaterialPageRoute(builder: (context)=>LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
