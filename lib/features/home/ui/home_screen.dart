import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/app/app_version.dart';
import 'package:front/infrastructure/error/firebase_error_reporter.dart';
import 'package:front/infrastructure/localization/generated/l10n.dart';
import 'package:front/infrastructure/localization/locale_options_provider.dart';
import 'package:front/infrastructure/localization/locale_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Future<void> _handleLocaleChange(String code) async {
    final options = ref.read(localeOptionsProvider);
    final option = options.firstWhere((o) => o.code == code);
    await setLocale(ref, option.locale);
  }

  void _sendCrashlyticsTest() {
    try {
      FirebaseErrorReporter().report(
        Exception('Manual Crashlytics test'),
        StackTrace.current,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Тест Crashlytics отправлен')),
      );
    } catch (error, stack) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Crashlytics недоступен: $error')));
      debugPrint('Crashlytics test failed: $error\n$stack');
    }
  }

  void _handleMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'settings':
        Navigator.pushNamed(context, '/settings');
        break;
      // case 'google':
      //   // TODO: авторизация через Google
      //   break;
      // case 'facebook':
      //   // TODO: авторизация через Facebook
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final options = ref.watch(localeOptionsProvider);
    final locale = ref.watch(localeProvider).valueOrNull;
    final currentLocaleCode = locale?.languageCode ?? 'en';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () => Navigator.pushNamed(context, '/profile'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: currentLocaleCode,
                // icon: const Icon(Icons.language, color: Colors.white),
                dropdownColor: Colors.grey[900],
                style: const TextStyle(color: Colors.white),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    _handleLocaleChange(newValue);
                  }
                },
                items: options
                    .map(
                      (o) =>
                          DropdownMenuItem(value: o.code, child: Text(o.emoji)),
                    )
                    .toList(),
              ),
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'settings',
                child: Text('⚙️ ${S.of(context).settings}'),
              ),
              // const PopupMenuDivider(),
              // const PopupMenuItem(
              //   value: 'google',
              //   child: Text('🔐 Войти через Google'),
              // ),
              // const PopupMenuItem(
              //   value: 'facebook',
              //   child: Text('🔐 Войти через Facebook'),
              // ),
            ],
            onSelected: (value) => _handleMenuSelection(context, value),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // ElevatedButton(
            //   onPressed: () => Navigator.pushNamed(context, '/batttle'),
            //   style: ElevatedButton.styleFrom(
            //     shape: const CircleBorder(),
            //     padding: const EdgeInsets.all(60),
            //   ),
            //   child: Text(
            //     S.of(context).play,
            //     style: const TextStyle(fontSize: 24),
            //   ),
            // ),
            // const SizedBox(height: 24),
            // OutlinedButton(
            //   onPressed: _sendCrashlyticsTest,
            //   child: const Text('Тест Crashlytics'),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: appVersion.isEmpty
          ? const Text('Unknown version')
          : SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'v$appVersion',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
    );
  }
}
