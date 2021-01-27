import 'package:flutter/material.dart';

class AllAvailableUnits extends StatefulWidget {
  @override
  AllAvailableUnits({Key key}) : super(key: key);
  _AllAvailableUnitsState createState() => _AllAvailableUnitsState();
}

class _AllAvailableUnitsState extends State<AllAvailableUnits> {
  static List<CountryModel> _dropdownItems = new List();
  final formKey = new GlobalKey<FormState>();
  // var controller = new MaskedTextController(mask: '(000) 000 0000');
  CountryModel _dropdownValue;
  String _errorText;
  TextEditingController phoneController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      _dropdownItems.add(CountryModel(country: 'India', countryCode: '+91'));
      _dropdownItems.add(CountryModel(country: 'USA', countryCode: '+1'));
      _dropdownValue = _dropdownItems[0];
      phoneController.text = _dropdownValue.countryCode;
    });
  }

  Widget _buildCountry() {
    return FormField(
      builder: (FormFieldState state) {
        return DropdownButtonHideUnderline(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new InputDecorator(
                decoration: InputDecoration(
                  filled: false,
                  hintText: 'Choose Country',
                  prefixIcon: Icon(Icons.location_on),
                  labelText:
                      _dropdownValue == null ? 'Where are you from' : 'From',
                  errorText: _errorText,
                ),
                isEmpty: _dropdownValue == null,
                child: new DropdownButton<CountryModel>(
                  value: _dropdownValue,
                  isDense: true,
                  onChanged: (CountryModel newValue) {
                    print('value change');
                    print(newValue);
                    setState(() {
                      _dropdownValue = newValue;
                      phoneController.text = _dropdownValue.countryCode;
                    });
                  },
                  items: _dropdownItems.map((CountryModel value) {
                    return DropdownMenuItem<CountryModel>(
                      value: value,
                      child: Text(value.country),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPhonefiled() {
    return Row(
      children: <Widget>[
        new Expanded(
          child: new TextFormField(
            controller: phoneController,
            enabled: false,
            decoration: InputDecoration(
              filled: false,
              // prefixIcon: Icon(FontAwesomeIcons.globe),
              labelText: 'code',
              hintText: "Country code",
            ),
          ),
          flex: 2,
        ),
        new SizedBox(
          width: 10.0,
        ),
        new Expanded(
          child: new TextFormField(
            // controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: false,
              labelText: 'mobile',
              hintText: "Mobile number",
              prefixIcon: new Icon(Icons.mobile_screen_share),
            ),
            onSaved: (String value) {},
          ),
          flex: 5,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // padding: EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Stack(
                    children: <Widget>[
                      _buildCountry(),
                      _buildPhonefiled(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CountryModel {
  String country = '';
  String countryCode = '';

  CountryModel({
    this.country,
    this.countryCode,
  });
}