// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:cryptowallet/components/user_details_placeholder.dart';
import 'package:cryptowallet/screens/dark_mode_toggler.dart';
import 'package:cryptowallet/screens/language.dart';
import 'package:cryptowallet/screens/wallet_connect.dart';
import 'package:cryptowallet/utils/json_viewer.dart';
// import 'package:get/get.dart';
import 'package:cryptowallet/screens/saved_urls.dart';
import 'package:cryptowallet/screens/security.dart';
import 'package:cryptowallet/screens/main_screen.dart';
import 'package:cryptowallet/screens/recovery_pharse.dart';
import 'package:cryptowallet/screens/send_token.dart';
import 'package:cryptowallet/screens/set_currency.dart';
import 'package:cryptowallet/screens/view_wallets.dart';
import 'package:cryptowallet/utils/rpc_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../components/loader.dart';
import '../utils/app_config.dart';
import '../utils/qr_scan_view.dart';

class Settings extends StatefulWidget {
  final bool isDarkMode;
  const Settings({this.isDarkMode, Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final darkModeKey = 'useDark';
  final pref = Hive.box(secureStorageKey);
  bool walletAvailable = false;
  @override
  void initState() {
    walletAvailable = pref.get(currentMmenomicKey) != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: const [DarkModeToggler()],
        title: Text(AppLocalizations.of(context).settings),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                if (walletAvailable)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context).account,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                if (walletAvailable)
                  const SizedBox(
                    height: 10,
                  ),
                if (walletAvailable)
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: UserDetailsPlaceHolder(
                        size: .5,
                        showHi: false,
                        textSize: 18,
                      ),
                    ),
                  ),
                if (walletAvailable)
                  const SizedBox(
                    height: 20,
                  ),
                if (walletAvailable)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context).wallet,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                if (walletAvailable)
                  const SizedBox(
                    height: 10,
                  ),
                if (walletAvailable)
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const SetCurrency()));
                              // Get.to(
                              //   const SetCurrency(),
                              // );
                            },
                            child: SizedBox(
                              height: 35,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/currency_new.svg',
                                        width: 25,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        AppLocalizations.of(context).currency,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                          InkWell(
                            onTap: () async {
                              await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => const Language()));
                              // Get.to(const Language());
                            },
                            child: SizedBox(
                              height: 35,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 26,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          color: Color(0xffEBF3FF),
                                        ),
                                        child: Icon(
                                          Icons.language,
                                          size: 22,
                                          color: Color(0xff2469E9),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        AppLocalizations.of(context).language,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (walletAvailable)
                  const SizedBox(
                    height: 20,
                  ),
                if (walletAvailable)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context).security,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                if (walletAvailable)
                  const SizedBox(
                    height: 10,
                  ),
                if (walletAvailable)
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () async {
                                String mnemonic = (Hive.box(secureStorageKey))
                                    .get(currentMmenomicKey);
                                if (await authenticate(context)) {
                                  // Get.closeAllSnackbars();
                                  ScaffoldMessenger.of(context)
                                      .removeCurrentSnackBar();
                                  // Get.to(
                                  //   RecoveryPhrase(
                                  //     data: mnemonic,
                                  //     verify: false,
                                  //   ),
                                  // );
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => RecoveryPhrase(
                                      data: mnemonic,
                                      verify: false,
                                    ),
                                  ));
                                } else {
                                  // Get.snackbar(
                                  //   '',
                                  //   AppLocalizations.of(context).authFailed,
                                  //   colorText: Colors.white,
                                  //   backgroundColor: Colors.red,
                                  // );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(AppLocalizations.of(context)
                                        .authFailed),
                                    backgroundColor: Colors.red,
                                    action: SnackBarAction(
                                      label: 'OK',
                                      onPressed: () {},
                                      textColor: Colors.white,
                                    ),
                                  ));
                                }
                              },
                              child: SizedBox(
                                height: 35,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/show_seed_phrase_new.svg',
                                          width: 25,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)
                                              .showmnemonic,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(),
                            InkWell(
                              onTap: () async {
                                if (await authenticate(
                                  context,
                                  useLocalAuth: false,
                                )) {
                                  // Get.closeAllSnackbars();
                                  ScaffoldMessenger.of(context)
                                      .removeCurrentSnackBar();
                                  // Get.to(
                                  //   const Security(
                                  //     isChangingPin: true,
                                  //   ),
                                  // );
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const Security(
                                      isChangingPin: true,
                                    ),
                                  ));
                                } else {
                                  // Get.snackbar(
                                  //   '',
                                  //   AppLocalizations.of(context).authFailed,
                                  //   colorText: Colors.white,
                                  //   backgroundColor: Colors.red,
                                  // );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(AppLocalizations.of(context)
                                        .authFailed),
                                    backgroundColor: Colors.red,
                                    action: SnackBarAction(
                                      label: 'OK',
                                      onPressed: () {},
                                      textColor: Colors.white,
                                    ),
                                  ));
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: 35,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/security_new.svg',
                                          width: 25,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)
                                              .changePin,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context).web,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () async {
                              final pref = Hive.box(secureStorageKey);
                              List data = [];
                              if (pref.get(bookMarkKey) != null) {
                                data =
                                    jsonDecode(pref.get(bookMarkKey)) as List;
                              }
                              final localize = AppLocalizations.of(context);

                              final bookmarkTitle = localize.bookMark;
                              final bookmarkEmpty = localize.noBookMark;
                              await Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (_) => SavedUrls(
                                  bookmarkTitle,
                                  bookmarkEmpty,
                                  bookMarkKey,
                                  data: data,
                                ),
                              ));
                              // Get.to(
                              //   SavedUrls(
                              //     bookmarkTitle,
                              //     bookmarkEmpty,
                              //     bookMarkKey,
                              //     data: data,
                              //   ),
                              // );
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: 35,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset('assets/bookmark.svg',
                                          width: 25),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        AppLocalizations.of(context).bookMark,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                if (walletAvailable)
                  const SizedBox(
                    height: 20,
                  ),
                if (walletAvailable)
                  FutureBuilder<Object>(future: () async {
                    PackageInfo packageInfo = await PackageInfo.fromPlatform();
                    return {
                      'appName': packageInfo.appName,
                      'version': packageInfo.version,
                      'buildNumber': packageInfo.buildNumber
                    };
                  }(), builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map data = snapshot.data;
                      return Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                              text: data['appName'],
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                              children: [
                                TextSpan(
                                  text:
                                      ' v${data['version']} (${data['buildNumber']})',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                )
                              ]),
                        ),
                      );
                    }
                    return Text('');
                  })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
