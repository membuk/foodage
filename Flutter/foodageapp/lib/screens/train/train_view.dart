part of 'train_screen.dart';

extension TrainView on _TrainScreenState {
  Widget _build(BuildContext context) {
    return BaseScaffold(
      bottomNavigationBar: const BaseBottomNavigationBar(initialIndex: 2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Utils.appColor.inactiveColor),
                    ),
                  ),
                  child: Text(
                    file != null
                        ? file!.path.split(Platform.pathSeparator).last
                        : Translation.translateKey("no_file"),
                    style: Utils.textStyles.boldTextStyle,
                  ),
                ),
                const SizedBox(width: 16),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Utils.appColor.primaryColor,
                  child: IconButton(
                    icon: Icon(
                      Icons.file_copy,
                      color: Utils.appColor.backgroundColor,
                    ),
                    onPressed: selectCsvFile,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  Theme(
                    data:
                        ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                        title: Text(Translation.translateKey("appetizer"),
                            style: Utils.textStyles.boldTextStyle),
                        children: getListTiles(appetizers)),
                  ),
                  Theme(
                    data:
                        ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                        title: Text(Translation.translateKey("main"),
                            style: Utils.textStyles.boldTextStyle),
                        children: getListTiles(mains)),
                  ),
                  Theme(
                    data:
                        ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                        title: Text(Translation.translateKey("beverage"),
                            style: Utils.textStyles.boldTextStyle),
                        children: getListTiles(beverages)),
                  ),
                  Theme(
                    data:
                        ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                        title: Text(Translation.translateKey("other"),
                            style: Utils.textStyles.boldTextStyle),
                        children: getListTiles(others)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: loading
                    ? null
                    : () async {
                        if (file == null) {
                          AlertWidgets.showError(
                              error: "CSV dosyası yüklenmemiş."); // TODO

                          return;
                        }

                        bool leftOut = false;

                        for (String element in all) {
                          if (!appetizers.contains(element) &&
                              !mains.contains(element) &&
                              !beverages.contains(element) &&
                              !others.contains(element)) {
                            leftOut = true;
                          }
                        }

                        if (leftOut) {
                          bool sure = await leftOutSure();
                          if (!sure) return;
                        }

                        await trainMachine();
                      },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Utils.appColor.primaryColor,
                ),
                child: Text(
                  Translation.translateKey("train"),
                  style: TextStyle(color: Utils.appColor.backgroundColor),
                )),
          ],
        ),
      ),
    );
  }

  Future<bool> leftOutSure() async {
    dynamic data = await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            backgroundColor: Utils.appColor.backgroundColor,
            child: Container(
                height: 220,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Are you sure?",
                      style: Utils.textStyles.headingStyle,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "    There are food(s) that you have not selected, and if you do not select them, you will not be able to see them during the testing phase. Are you sure you want to continue?",
                      style: Utils.textStyles.textStyle,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => Routes.pop(data: true),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Utils.appColor.primaryColor),
                          child: Text(
                            "Yes",
                            style: TextStyle(
                                color: Utils.appColor.backgroundColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 30),
                        ElevatedButton(
                          onPressed: () => Routes.pop(data: false),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Utils.appColor.primaryColor,
                          ),
                          child: Text(
                            "No",
                            style: TextStyle(
                                color: Utils.appColor.backgroundColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });

    return data == true;
  }

  List<Widget> getListTiles(List<String> selectedItems) {
    List<Widget> tiles = [];

    tiles.addAll(selectedItems.map((e) => foodTile(
        text: e,
        selected: true,
        onPressed: () => localSetState(() => selectedItems.remove(e)))));

    for (String item in all) {
      if (!appetizers.contains(item) &&
          !mains.contains(item) &&
          !beverages.contains(item) &&
          !others.contains(item)) {
        tiles.add(foodTile(
            text: item,
            onPressed: () => localSetState(() => selectedItems.add(item))));
      }
    }

    return tiles;
  }

  Widget foodTile(
      {required String text, Function()? onPressed, bool selected = false}) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
        child: Row(
          children: [
            Icon(
              selected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: selected
                  ? Utils.appColor.primaryColor
                  : Utils.appColor.inactiveColor,
              size: 28,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: selected
                    ? Utils.appColor.primaryColor
                    : Utils.appColor.inactiveColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
