part of 'information_screen.dart';

extension InformationView on InformationScreen {
  Widget _build(BuildContext context) {
    return BaseScaffold(
      safeAreaPadding: 20.0,
      bottomNavigationBar: const BaseBottomNavigationBar(initialIndex: 0),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Image.asset(
                  "assets/icons/foodage_icon_transparent.png",
                  width: 240,
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tabbedText("${Translation.translateKey("our_purpose")}:",
                      Utils.textStyles.headingStyle),
                  const SizedBox(height: 5),
                  tabbedText(
                      "${Translation.translateKey("our_purpose_explanation")}.",
                      Utils.textStyles.textStyle),
                  const SizedBox(height: 10),
                  tabbedText("${Translation.translateKey("selected_goals")}:",
                      Utils.textStyles.headingStyle),
                  const SizedBox(height: 5),
                  clauseWidget(
                      " ${Translation.translateKey("goal_2_explanation")}.",
                      title: "${Translation.translateKey("goal")} 2:"),
                  clauseWidget(
                      " ${Translation.translateKey("goal_12_explanation")}.",
                      title: "${Translation.translateKey("goal")} 12:"),
                  const SizedBox(height: 10),
                  tabbedText("${Translation.translateKey("contributors")}:",
                      Utils.textStyles.headingStyle),
                  const SizedBox(height: 5),
                  clauseWidget("", title: "Mehmet Kekeç"),
                  clauseWidget("", title: "Özgür Yıldırım"),
                  clauseWidget("", title: "Eren Gülbahar"),
                  clauseWidget("", title: "Erdem Yıldırım"),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget clauseWidget(String text, {String? title}) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "    "),
          WidgetSpan(
            child: Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(bottom: 4.5, right: 8.0),
              decoration: BoxDecoration(
                  color: Utils.appColor.textColor,
                  borderRadius: BorderRadius.circular(1000.0)),
            ),
          ),
          if (title != null)
            TextSpan(text: title, style: Utils.textStyles.boldTextStyle),
          TextSpan(text: text, style: Utils.textStyles.textStyle)
        ],
      ),
    );
  }

  Widget tabbedText(String text, TextStyle style) {
    return RichText(
        text: TextSpan(children: [
      const TextSpan(text: "    "),
      TextSpan(text: text, style: style)
    ]));
  }
}
