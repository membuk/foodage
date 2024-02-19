part of 'settings_screen.dart';

extension SettingsView on _SettingsScreenState {
  Widget _build(BuildContext context) {
    return BaseScaffold(
      safeAreaPadding: 20.0,
      bottomNavigationBar: const BaseBottomNavigationBar(initialIndex: 3),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Text(
                Translation.translateKey("general"),
                style: Utils.textStyles.headingStyle,
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Utils.appColor.inactiveColor,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: showLanguageDialog,
                    child: Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: Utils.appColor.textColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          Translation.translateKey("general"),
                          style: Utils.textStyles.textStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Text(
                Translation.translateKey("about_us"),
                style: Utils.textStyles.headingStyle,
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Utils.appColor.inactiveColor,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.question_answer,
                          color: Utils.appColor.textColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          Translation.translateKey("which_tech_used"),
                          style: Utils.textStyles.textStyle,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.badge,
                          color: Utils.appColor.textColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          Translation.translateKey("license"),
                          style: Utils.textStyles.textStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showLanguageDialog() async {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            backgroundColor: Utils.appColor.backgroundColor,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (MapEntry entry in Translation.getLangMap().entries)
                      InkWell(
                        onTap: () async {
                          await Translation.setLanguage(entry.key);

                          Routes.popAll(force: true);
                          Routes.pushNamed(InformationScreen.route);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Translation.selectedLanguage == entry.key
                              ? Utils.appColor.foregroundColor
                              : Colors.transparent,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/${entry.key}.png',
                                width: 20,
                              ),
                              const SizedBox(width: 10),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "${entry.value}\n",
                                    style: Utils.textStyles.boldTextStyle),
                                TextSpan(
                                    text: Translation.translateKey(entry.key),
                                    style: TextStyle(
                                        color: Utils.appColor.textColor,
                                        fontSize: 10))
                              ]))
                            ],
                          ),
                        ),
                      ),
                  ],
                )),
          );
        });
  }
}
