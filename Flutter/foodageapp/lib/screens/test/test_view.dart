part of 'test_screen.dart';

extension TestView on _TestScreenState {
  Widget _build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: BaseFutureBuilder(
            future: foodNameFuture,
            builder: (snapshot) {
              final List<DropdownMenuItem<String>> appetizerItems =
                      getMenuItems(snapshot.data!['appetizers'] ?? []),
                  mainItems = getMenuItems(snapshot.data!['mains'] ?? []),
                  beverageItems =
                      getMenuItems(snapshot.data!['beverages'] ?? []),
                  otherItems = getMenuItems(snapshot.data!['others'] ?? []);

              return Column(
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Translation.translateKey("appetizer"),
                              style: Utils.textStyles.headingStyle,
                            ),
                            CustomDropDown<String>(
                              selectedItem: appetizer,
                              items: appetizerItems,
                              onChanged: (String? name) =>
                                  localSetState(func: () => appetizer = name),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Translation.translateKey("main"),
                              style: Utils.textStyles.headingStyle,
                            ),
                            CustomDropDown<String>(
                              selectedItem: main,
                              items: mainItems,
                              onChanged: (String? name) =>
                                  localSetState(func: () => main = name),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Translation.translateKey("beverage"),
                              style: Utils.textStyles.headingStyle,
                            ),
                            CustomDropDown<String>(
                              selectedItem: beverage,
                              items: beverageItems,
                              onChanged: (String? name) =>
                                  localSetState(func: () => beverage = name),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Translation.translateKey("other"),
                              style: Utils.textStyles.headingStyle,
                            ),
                            CustomDropDown<String>(
                              selectedItem: other,
                              items: otherItems,
                              onChanged: (String? name) =>
                                  localSetState(func: () => other = name),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: loading ? null : guessNumber,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Utils.appColor.primaryColor,
                      ),
                      child: Text(
                        Translation.translateKey("predict"),
                        style: TextStyle(color: Utils.appColor.backgroundColor),
                      )),
                  const SizedBox(height: 20),
                  if (expectedNumber != null)
                    Text(
                      "${Translation.translateKey("expected_number")}: $expectedNumber",
                      style: Utils.textStyles.headingStyle,
                    ),
                ],
              );
            }),
      ),
      bottomNavigationBar: const BaseBottomNavigationBar(initialIndex: 1),
    );
  }

  List<DropdownMenuItem<String>> getMenuItems(List<dynamic> list) {
    return list
        .map((e) => DropdownMenuItem<String>(
            value: e, child: Text(e, overflow: TextOverflow.ellipsis)))
        .toList();
  }
}
