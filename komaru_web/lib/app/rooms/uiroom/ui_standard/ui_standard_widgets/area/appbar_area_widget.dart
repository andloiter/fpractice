import 'package:komaru_web/app/ui_imports.dart';

// ignore: must_be_immutable
class AppBarAreaWidget extends StatelessWidget {
  AppBarAreaWidget({
    super.key,
    required this.titleName,
    this.popIcon = true,
    this.titleIcon,
  });

  final String titleName;
  final bool popIcon;
  IconData? titleIcon;

  Function? popFunc;

  @override
  Widget build(BuildContext context) {
    // タイトル行
    final List<Widget> _titleRows = [];
    // タイトル名
    _titleRows.add(Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Text(
        titleName,
      ),
    ));

    if (titleIcon != null) {
      _titleRows.add(Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
        child: Icon(
          titleIcon,
          size: 28,
        ),
      ));
    }

    return AppBar(
      automaticallyImplyLeading: popIcon,
      leading: !popIcon
          ? null
          : Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: IconButton(
                iconSize: 40,
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  if (popFunc != null) popFunc!();
                },
                // style: IconButton.styleFrom(
                //   foregroundColor: Theme.of(context).colorScheme.primary,
                //   backgroundColor: Theme.of(context).colorScheme.primary,
                //   disabledBackgroundColor: Theme.of(context).colorScheme.secondary,
                //   hoverColor: Colors.white,
                //   focusColor: Colors.white,
                // ),
              ),
            ),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: _titleRows,
      ),
      actions: const [],
      centerTitle: false,
      elevation: 10,
    );
  }
}
