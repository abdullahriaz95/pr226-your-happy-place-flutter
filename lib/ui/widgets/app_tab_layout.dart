import 'package:flutter/material.dart';

class AppTabLayout extends StatefulWidget {
  final String tab1Text;
  final String tab2Text;
  final Function(int) ontap;
  final int? alreadySelectedtab;

  const AppTabLayout({
    Key? key,
    required this.tab1Text,
    required this.tab2Text,
    required this.ontap,
    this.alreadySelectedtab,
  }) : super(key: key);

  @override
  _AppTabLayoutState createState() => _AppTabLayoutState();
}

class _AppTabLayoutState extends State<AppTabLayout> {
  int tabSelected = 0;

  @override
  void initState() {
    if (widget.alreadySelectedtab != null) {
      tabSelected = widget.alreadySelectedtab!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: PhysicalModel(
        color: Colors.white,
        elevation: 8,
        borderRadius: BorderRadius.circular(24),
        shadowColor: Colors.grey,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      tabSelected = 0;
                    });
                    widget.ontap.call(0);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14.0),
                              child: Text(
                                widget.tab1Text,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 5,
                          decoration: BoxDecoration(
                            color: tabSelected == 0
                                ? Colors.grey.shade700
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      tabSelected = 1;
                    });
                    widget.ontap.call(1);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14.0),
                              child: Text(
                                widget.tab2Text,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 5,
                          decoration: BoxDecoration(
                            color: tabSelected == 1
                                ? Colors.grey.shade700
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
