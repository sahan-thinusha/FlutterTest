

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

class CustomResponsiveDatatable extends StatefulWidget {
  final bool? rightClickable;
  final bool? removeCheckBox;
  final bool? showSelect;
  final Color? titleBackgroundColor;
  final Color? footerBackgroundColor;
  final List<DatatableHeader>? headers;
  final List<Map<String, dynamic>>? source;
  final List<Map<String, dynamic>>? selecteds;
  final Widget? title;
  final List<Widget>? actions;
  final List<Widget>? footers;
  final Function(bool value)? onSelectAll;
  final Function(bool value, Map<String, dynamic> data)? onSelect;
  final Function(Map<String, dynamic> value)? onTabRow;
  final Function(dynamic value)? onSort;
  final String? sortColumn;
  final bool? sortAscending;
  final bool? isLoading;
  final bool? autoHeight;
  final bool? hideUnderline;
  final bool? commonMobileView;
  final bool? isExpandRows;
  final List<bool>? expanded;
  final Widget Function(Map<String, dynamic> value)? dropContainer;
  final Function(Map<String, dynamic> value, DatatableHeader header)?
      onChangedRow;
  final Function(Map<String, dynamic> value, DatatableHeader header)?
      onSubmittedRow;
  final List<ScreenSize>? reponseScreenSizes;
  final List<List<dynamic>>? rightClickActions;

  /// `headerDecoration`
  ///
  /// allow to decorate the header row
  final BoxDecoration? headerDecoration;

  /// `rowDecoration`
  ///
  /// allow to decorate the data row
  final BoxDecoration? rowDecoration;

  /// `selectedDecoration`
  ///
  /// allow to decorate the selected data row
  final BoxDecoration? selectedDecoration;

  /// `selectedTextStyle`
  ///
  /// allow to styling the header row
  final TextStyle? headerTextStyle;

  /// `selectedTextStyle`
  ///
  /// allow to styling the data row
  final TextStyle? rowTextStyle;

  /// `selectedTextStyle`
  ///
  /// allow to styling the selected data row
  final TextStyle? selectedTextStyle;

  const CustomResponsiveDatatable({
    Key? key,
    this.rightClickable = false,
    this.showSelect = false,
    this.onSelectAll,
    this.onSelect,
    this.onTabRow,
    this.onSort,
    this.headers = const [],
    this.source,
    this.selecteds,
    this.title,
    this.actions,
    this.footers,
    this.sortColumn,
    this.sortAscending,
    this.isLoading = false,
    this.autoHeight = true,
    this.hideUnderline = true,
    this.commonMobileView = false,
    this.isExpandRows = true,
    this.expanded,
    this.dropContainer,
    this.onChangedRow,
    this.onSubmittedRow,
    this.removeCheckBox = true,
    this.reponseScreenSizes = const [
      ScreenSize.xs,
      ScreenSize.sm,
      ScreenSize.md
    ],
    this.headerDecoration,
    this.rowDecoration,
    this.selectedDecoration,
    this.headerTextStyle,
    this.rowTextStyle,
    this.selectedTextStyle,
    this.rightClickActions,
    this.titleBackgroundColor = Colors.amber,
    this.footerBackgroundColor = Colors.amber,
  }) : super(key: key);

  @override
  _CustomResponsiveDatatableState createState() =>
      _CustomResponsiveDatatableState();
}

class _CustomResponsiveDatatableState extends State<CustomResponsiveDatatable> {
  Widget mobileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.removeCheckBox!
            ? Container(
                width: 0,
                height: 0,
              )
            // : Checkbox(
            //     value: widget.selecteds!.length == widget.source!.length &&
            //         widget.source != null &&
            //         widget.source!.isNotEmpty,
            //     onChanged: (value) {
            //       if (widget.onSelectAll != null) widget.onSelectAll!(value);
            //     },
            //   ),
            : Text(
                "Acton",
                textAlign: TextAlign.start,
              ),
        PopupMenuButton(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: const Text("SORT BY"),
            ),
            tooltip: "SORT BY",
            initialValue: widget.sortColumn,
            itemBuilder: (_) => widget.headers!
                .where(
                    (header) => header.show == true && header.sortable == true)
                .toList()
                .map((header) => PopupMenuItem(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            header.text,
                            textAlign: header.textAlign,
                          ),
                          if (widget.sortColumn != null &&
                              widget.sortColumn == header.value)
                            widget.sortAscending!
                                ? const Icon(Icons.arrow_downward, size: 15)
                                : const Icon(Icons.arrow_upward, size: 15)
                        ],
                      ),
                      value: header.value,
                    ))
                .toList(),
            onSelected: (dynamic value) {
              if (widget.onSort != null) widget.onSort!(value);
            })
      ],
    );
  }

  List<Widget> mobileList() {
    final _decoration = BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)));
    final _rowDecoration = widget.rowDecoration ?? _decoration;
    final _selectedDecoration = widget.selectedDecoration ?? _decoration;
    return widget.source!.map((data) {
      return Listener(
        onPointerDown: (PointerDownEvent event) async {
          if (widget.rightClickable!) {
            // Check if right mouse button clicked
            if (event.kind == PointerDeviceKind.mouse &&
                event.buttons == kSecondaryMouseButton) {
              final overlay =
                  Overlay.of(context)?.context.findRenderObject() as RenderBox;
              final menuItem = await showMenu<int>(
                  context: context,
                  items: widget.rightClickActions!
                      .map((item) => PopupMenuItem(
                            child: Text(item[0]),
                            value: item[1] as int,
                            onTap: () {
                              item[2](data);
                            },
                          ))
                      .toList(),
                  position: RelativeRect.fromSize(
                      event.position & Size(48.0, 48.0), overlay.size));
            }
          }
        },
        child: InkWell(
          onTap: () => widget.onTabRow?.call(data),
          child: Container(
            decoration: widget.selecteds!.contains(data)
                ? _selectedDecoration
                : _rowDecoration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    if (widget.showSelect! && widget.selecteds != null)
                      widget.removeCheckBox!
                          ? Container(
                              width: 0,
                              height: 0,
                            )
                          : Checkbox(
                              value: widget.selecteds!.contains(data),
                              onChanged: (value) {
                                if (widget.onSelect != null) {
                                  widget.onSelect!(value!, data);
                                }
                              }),
                  ],
                ),
                if (widget.commonMobileView! && widget.dropContainer != null)
                  widget.dropContainer!(data),
                if (!widget.commonMobileView!)
                  ...widget.headers!
                      .where((header) => header.show == true)
                      .toList()
                      .map(
                        (header) => Container(
                          padding: const EdgeInsets.all(11),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              header.headerBuilder != null
                                  ? header.headerBuilder!(header.value)
                                  : Text(
                                      header.text,
                                      overflow: TextOverflow.clip,
                                      style: widget.selecteds!.contains(data)
                                          ? widget.selectedTextStyle
                                          : widget.rowTextStyle,
                                    ),
                              const Spacer(),
                              header.sourceBuilder != null
                                  ? header.sourceBuilder!(
                                      data[header.value], data)
                                  : header.editable
                                      ? TextEditableWidget(
                                          data: data,
                                          header: header,
                                          textAlign: TextAlign.end,
                                          onChanged: widget.onChangedRow,
                                          onSubmitted: widget.onSubmittedRow,
                                          hideUnderline: widget.hideUnderline!,
                                        )
                                      : Text(
                                          "${data[header.value]}",
                                          style: widget.selecteds!.contains(data)
                                              ? widget.selectedTextStyle
                                              : widget.rowTextStyle,
                                        )
                            ],
                          ),
                        ),
                      )
                      .toList()
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  static Alignment headerAlignSwitch(TextAlign textAlign) {
    switch (textAlign) {
      case TextAlign.center:
        return Alignment.center;
      case TextAlign.left:
        return Alignment.centerLeft;
      case TextAlign.right:
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }

  Widget desktopHeader() {
    final _headerDecoration = widget.headerDecoration ??
        BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)));
    return Container(
      decoration: _headerDecoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...widget.headers!
              .where((header) => header.show == true)
              .map(
                (header) => Expanded(
                    flex: header.flex,
                    child: InkWell(
                      onTap: () {
                        if (widget.onSort != null && header.sortable) {
                          widget.onSort!(header.value);
                        }
                      },
                      child: header.headerBuilder != null
                          ? header.headerBuilder!(header.value)
                          : Container(
                              padding: const EdgeInsets.only(
                                  left: 5, top: 11, bottom: 11),
                              alignment: headerAlignSwitch(header.textAlign),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    header.text,
                                    textAlign: header.textAlign,
                                    style: widget.headerTextStyle,
                                  ),
                                  if (widget.sortColumn != null &&
                                      widget.sortColumn == header.value)
                                    widget.sortAscending!
                                        ? const Icon(Icons.arrow_downward,
                                            size: 15)
                                        : const Icon(Icons.arrow_upward,
                                            size: 15)
                                ],
                              ),
                            ),
                    )),
              )
              .toList(),
          if (widget.showSelect! && widget.selecteds != null)
            widget.removeCheckBox!
                ? Container(
                    width: 0,
                    height: 0,
                  )
                // : Checkbox(
                //     value: widget.selecteds!.length == widget.source!.length &&
                //         widget.source != null &&
                //         widget.source!.isNotEmpty,
                //     onChanged: (value) {
                //       if (widget.onSelectAll != null)
                //         widget.onSelectAll!(value);
                //     }),
                : Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      "Acton",
                      textAlign: TextAlign.start,
                    ),
                  ),
        ],
      ),
    );
  }

  List<Widget> desktopList() {
    final _decoration = BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)));
    final _rowDecoration = widget.rowDecoration ?? _decoration;
    final _selectedDecoration = widget.selectedDecoration ?? _decoration;
    List<Widget> widgets = [];
    for (var index = 0; index < widget.source!.length; index++) {
      final data = widget.source![index];
      widgets.add(Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Listener(
            onPointerDown: (PointerDownEvent event) async {
              if (widget.rightClickable!) {
                // Check if right mouse button clicked
                if (event.kind == PointerDeviceKind.mouse &&
                    event.buttons == kSecondaryMouseButton) {
                  final overlay = Overlay.of(context)
                      ?.context
                      .findRenderObject() as RenderBox;
                  final menuItem = await showMenu<int>(
                      context: context,
                      items: widget.rightClickActions!
                          .map((item) => PopupMenuItem(
                                child: Text(item[0]),
                                value: item[1] as int,
                                onTap: () {
                                  item[2](data);
                                },
                              ))
                          .toList(),
                      position: RelativeRect.fromSize(
                          event.position & Size(48.0, 48.0), overlay.size));
                }
              }
            },
            child: InkWell(
              onTap: () {
                widget.onTabRow?.call(data);
                setState(() {
                  widget.expanded![index] = !widget.expanded![index];
                });
              },
              child: Container(
                padding: EdgeInsets.only(
                    left: widget.showSelect! ? 0 : 15,
                    right: widget.showSelect! ? 0 : 15,
                    top: widget.showSelect! ? 8 : 15,
                    bottom: widget.showSelect! ? 8 : 15),

                /// TODO:
                decoration: widget.selecteds!.contains(data)
                    ? _selectedDecoration
                    : _rowDecoration,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...widget.headers!
                        .where((header) => header.show == true)
                        .map(
                          (header) => Expanded(
                            flex: header.flex,
                            child: header.sourceBuilder != null
                                ? header.sourceBuilder!(data[header.value], data)
                                : header.editable
                                    ? TextEditableWidget(
                                        data: data,
                                        header: header,
                                        textAlign: header.textAlign,
                                        onChanged: widget.onChangedRow,
                                        onSubmitted: widget.onSubmittedRow,
                                        hideUnderline: widget.hideUnderline!,
                                      )
                                    : Container(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          "${data[header.value]}",
                                          textAlign: header.textAlign,
                                          style: widget.selecteds!.contains(data)
                                              ? widget.selectedTextStyle
                                              : widget.rowTextStyle,
                                        ),
                                      ),
                          ),
                        )
                        .toList(),
                    if (widget.showSelect! && widget.selecteds != null)
                      Row(
                        children: [
                          widget.removeCheckBox!
                              ? Container(
                                  width: 0,
                                  height: 0,
                                )
                              : Checkbox(
                                  value: widget.selecteds!.contains(data),
                                  onChanged: (value) {
                                    if (widget.onSelect != null) {
                                      widget.onSelect!(value!, data);
                                    }
                                  }),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.isExpandRows! &&
              widget.expanded![index] &&
              widget.dropContainer != null)
            widget.dropContainer!(data)
        ],
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return widget.reponseScreenSizes!.isNotEmpty &&
            widget.reponseScreenSizes!.contains(context.screenSize)
        ?

        /// for small screen
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// title and actions
              if (widget.title != null || widget.actions != null)
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: widget.titleBackgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.title != null) widget.title!,
                      if (widget.actions != null) ...widget.actions!
                    ],
                  ),
                ),

              if (widget.autoHeight!)
                Column(
                  children: [
                    if (widget.showSelect! && widget.selecteds != null)
                      mobileHeader(),
                    if (widget.isLoading!) const LinearProgressIndicator(),
                    ...mobileList(),
                  ],
                ),
              if (!widget.autoHeight!)
                Expanded(
                  child: ListView(
                    /// itemCount: source.length,
                    children: [
                      if (widget.showSelect! && widget.selecteds != null)
                        mobileHeader(),
                      if (widget.isLoading!) const LinearProgressIndicator(),

                      /// mobileList
                      ...mobileList(),
                    ],
                  ),
                ),

              /// footer
              if (widget.footers != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          color: widget.footerBackgroundColor,
                        ),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [...widget.footers!],
                        ),
                      ),
                    ),
                  ],
                )
            ],
          )
        /**
          * for large screen
          */
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //title and actions
              if (widget.title != null || widget.actions != null)
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: widget.titleBackgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.title != null) widget.title!,
                      if (widget.actions != null) ...widget.actions!
                    ],
                  ),
                ),

              /// desktopHeader
              if (widget.headers!.isNotEmpty) desktopHeader(),

              if (widget.isLoading!) const LinearProgressIndicator(),

              if (widget.autoHeight!) Column(children: desktopList()),

              if (!widget.autoHeight!)
                // desktopList
                if (widget.source != null && widget.source!.isNotEmpty)
                  Expanded(child: ListView(children: desktopList())),

              //footer
              if (widget.footers != null)
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          color: widget.footerBackgroundColor,
                        ),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [...widget.footers!],
                        ),
                      ),
                    ),
                  ],
                )
            ],
          );
  }
}
