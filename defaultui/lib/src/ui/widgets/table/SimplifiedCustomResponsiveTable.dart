import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

import 'CustomResponsiveDatatable.dart';
import 'DropDownContainer.dart';

class SimplifiedCustomResponsiveTable extends StatefulWidget {
  final bool? rightClickable;

  final List<DatatableHeader>? headers;

  final Widget? title;

  final BoxDecoration? headerDecoration;

  final List<List<dynamic>>? rightClickActions;

  final Color? titleBackgroundColor;

  final Color? footerBackgroundColor;

  final String? searchKey;

  final List<Map<String, dynamic>>? data;

  final bool? removeCheckBox;

  final bool? footer;

  const SimplifiedCustomResponsiveTable({
    Key? key,
    this.rightClickable = false,
    this.headers = const [],
    this.title,
    this.headerDecoration,
    this.rightClickActions,
    this.titleBackgroundColor = Colors.amber,
    this.footerBackgroundColor = Colors.amber,
    this.searchKey = "id",
    this.data = const [],
    this.removeCheckBox = true,
    this.footer = true,
  }) : super(key: key);

  @override
  State<SimplifiedCustomResponsiveTable> createState() =>
      _SimplifiedCustomResponsiveTableState();
}

class _SimplifiedCustomResponsiveTableState
    extends State<SimplifiedCustomResponsiveTable> {
  List<DatatableHeader>? _headers;

  List<int> _perPages = [10, 20, 50, 100];
  int _total = 100;
  int _currentPerPage = 10;
  List<bool>? _expanded;
  String _searchKey = "id";

  int _currentPage = 1;
  bool _isSearch = false;
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];

  String? _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  bool _showSelect = true;

  List<Map<String, dynamic>> _data = [];

  _initializeData() async {
    _mockPullData();
  }

  _mockPullData() async {
    _expanded = List.generate(_currentPerPage, (index) => false);

    setState(() => _isLoading = true);
    Future.delayed(Duration(seconds: 3)).then((value) {
      _sourceOriginal.clear();
      _sourceOriginal.addAll(_data);
      _sourceFiltered = _sourceOriginal;
      _total = _sourceFiltered.length;
      _source = _sourceFiltered
          .getRange(0, _total < _currentPerPage ? _total : _currentPerPage)
          .toList();
      setState(() => _isLoading = false);
    });
  }

  _resetData({start: 0}) async {
    setState(() => _isLoading = true);
    var _expandedLen =
        _total - start < _currentPerPage ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoading = false);
    });
  }

  _filterData(value) {
    setState(() => _isLoading = true);

    try {
      if (value == "" || value == null) {
        _sourceFiltered = _sourceOriginal;
      } else {
        _sourceFiltered = _sourceOriginal
            .where((data) => data[_searchKey]
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }

      _total = _sourceFiltered.length;
      var _rangeTop = _total < _currentPerPage ? _total : _currentPerPage;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      print(e);
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    //only if right clickable true
    //window.document.onContextMenu.listen((evt) => evt.preventDefault());

    setState(() {
      _searchKey = widget.searchKey!;
      _data = widget.data!;
      _headers = widget.headers;
    });

    /// set headers
    _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(

            ),
            child: Card(
              margin: EdgeInsets.all(0),
              elevation: 1,
              shadowColor: Colors.black,
              clipBehavior: Clip.none,
              child: CustomResponsiveDatatable(
                removeCheckBox: widget.removeCheckBox,
                headerDecoration: widget.headerDecoration,
                isExpandRows: false,
                title: widget.title,
                rightClickable: widget.rightClickable,
                titleBackgroundColor: widget.titleBackgroundColor,
                footerBackgroundColor: widget.footerBackgroundColor,
                reponseScreenSizes: [
                  ScreenSize.xs,
                ],
                rightClickActions: widget.rightClickActions,
                actions: [
                  // if (_isSearch)
                  //   Expanded(
                  //       child: TextField(
                  //     decoration: InputDecoration(
                  //         hintText: 'Enter search term based on ' +
                  //             _searchKey!
                  //                 .replaceAll(new RegExp('[\\W_]+'), ' ')
                  //                 .toUpperCase(),
                  //         prefixIcon: IconButton(
                  //             icon: Icon(Icons.cancel),
                  //             onPressed: () {
                  //               setState(() {
                  //                 _isSearch = false;
                  //               });
                  //               _initializeData();
                  //             }),
                  //         suffixIcon: IconButton(
                  //             icon: Icon(Icons.search), onPressed: () {})),
                  //     onChanged: (value) {
                  //       _filterData(value);
                  //     },
                  //     onSubmitted: (value) {
                  //       _filterData(value);
                  //     },
                  //   )),
                  // if (!_isSearch)
                  //   IconButton(
                  //       icon: Icon(Icons.search),
                  //       onPressed: () {
                  //         setState(() {
                  //           _isSearch = true;
                  //         });
                  //       })
                ],
                headers: _headers,
                source: _source,
                selecteds: _selecteds,
                showSelect: _showSelect,
                autoHeight: true,
                dropContainer: (data) {
                  if (int.tryParse(data['id'].toString())!.isEven) {
                    return Text("is Even");
                  }
                  return DropDownContainer(data: data);
                },
                onChangedRow: (value, header) {
                  /// print(value);
                  /// print(header);
                },
                onSubmittedRow: (value, header) {
                  /// print(value);
                  /// print(header);
                },
                onTabRow: (data) {
                  print(data);
                },
                onSort: (value) {
                  setState(() => _isLoading = true);

                  setState(() {
                    _sortColumn = value;
                    _sortAscending = !_sortAscending;
                    if (_sortAscending) {
                      _sourceFiltered.sort((a, b) =>
                          b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                    } else {
                      _sourceFiltered.sort((a, b) =>
                          a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                    }
                    var _rangeTop = _currentPerPage < _sourceFiltered.length
                        ? _currentPerPage
                        : _sourceFiltered.length;
                    _source = _sourceFiltered.getRange(0, _rangeTop).toList();
                    _searchKey = value;

                    _isLoading = false;
                  });
                },
                expanded: _expanded,
                sortAscending: _sortAscending,
                sortColumn: _sortColumn,
                isLoading: _isLoading,
                onSelect: (value, item) {
                  print("$value  $item ");
                  if (value) {
                    setState(() => _selecteds.add(item));
                  } else {
                    setState(
                        () => _selecteds.removeAt(_selecteds.indexOf(item)));
                  }
                },
                onSelectAll: (value) {
                  if (value) {
                    setState(() => _selecteds =
                        _source.map((entry) => entry).toList().cast());
                  } else {
                    setState(() => _selecteds.clear());
                  }
                },
                footers: widget.footer!
                    ? [
                        IconButton(
                            onPressed: _initializeData,
                            icon: Icon(
                              Icons.refresh_sharp,
                              size: 16,
                            )),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Page"),
                        ),
                        Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            child: Text(
                                "${(_currentPage / _currentPerPage).ceil()}"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Rows per page"),
                        ),
                        if (_perPages.isNotEmpty)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: DropdownButton<int>(
                              value: _currentPerPage,
                              items: _perPages
                                  .map((e) => DropdownMenuItem<int>(
                                        child: Text("$e"),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (dynamic value) {
                                setState(() {
                                  _currentPerPage = value;
                                  _currentPage = 1;
                                  _resetData();
                                });
                              },
                              isExpanded: false,
                            ),
                          ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                              "$_currentPage - $_currentPerPage of $_total"),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                          ),
                          onPressed: _currentPage == 1
                              ? null
                              : () {
                                  var _nextSet = _currentPage - _currentPerPage;
                                  setState(() {
                                    _currentPage = _nextSet > 1 ? _nextSet : 1;
                                    _resetData(start: _currentPage - 1);
                                  });
                                },
                          padding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios, size: 16),
                          onPressed: _currentPage + _currentPerPage - 1 > _total
                              ? null
                              : () {
                                  var _nextSet = _currentPage + _currentPerPage;

                                  setState(() {
                                    _currentPage = _nextSet < _total
                                        ? _nextSet
                                        : _total - _currentPerPage;
                                    _resetData(start: _nextSet - 1);
                                  });
                                },
                          padding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ]
                    : [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
