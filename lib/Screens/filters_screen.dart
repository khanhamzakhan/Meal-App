import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> _currentFilters;

  FilterScreen(this._currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  initState() {
    _glutenfree = widget._currentFilters['gluten'];
    _lactosefree = widget._currentFilters['lactose'];
    _vegetarian = widget._currentFilters['vegetarian'];
    _vegan = widget._currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(bool currentvalue, String titletext,
      String subtitletext, Function updatevalue) {
    return SwitchListTile(
      title: Text(
        titletext,
      ),
      subtitle: Text(subtitletext),
      value: currentvalue,
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenfree,
                  'lactose': _lactosefree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'Adjust Your Meal Selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  _glutenfree, 'Gluten-Free', 'Only include gluten free meals',
                  (newvalue) {
                setState(() {
                  _glutenfree = newvalue;
                });
              }),
              _buildSwitchListTile(_lactosefree, 'Lactose-Free',
                  'only include lactose free meals', (newvalue) {
                setState(() {
                  _lactosefree = newvalue;
                });
              }),
              _buildSwitchListTile(
                  _vegetarian, 'Vegetarian', 'only include Vegetarian meals',
                  (newvalue) {
                setState(() {
                  _vegetarian = newvalue;
                });
              }),
              _buildSwitchListTile(_vegan, 'Vegan', 'only include Vegan meals',
                  (newvalue) {
                setState(() {
                  _vegan = newvalue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
