import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPage createState() => _InputPage();
}

class _InputPage extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';
  List<String> _options = [
    'Option01',
    'Option02',
    'Option03',
    'Option04',
    'Option05',
  ];

  String _selectedOption = 'Option01';
  TextEditingController _fieldPicker = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Page')),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPeople(),          
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Caracteres: ${_email.length}'),
          hintText: 'Nombre de usuario',
          labelText: 'Nombre',
          helperText: 'Solo los nombres',
          // suffixIcon: Icon(Icons.people)
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPeople() {
    return ListTile(
      title: Text('El nombre es: $_name'),
      subtitle: Text("El E-Mail es: $_email"),
      trailing: Text(_selectedOption),
    );
  }

  Widget _createEmail() {
    return TextField(
      // textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Caracteres: ${_name.length}'),
          hintText: 'Correo electronico',
          labelText: 'E-Mail',
          helperText: 'Solo correo',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          icon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.lock_outline_rounded),
          hintText: 'Contraseña de usuario',
          labelText: 'Contraseña',
          helperText: 'Debe ser segura',
          counter: Text('Cantidad de caracteres: ${_password.length}')),
      onChanged: (value) => setState(() {
        _password = value;
      }),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _fieldPicker,
      decoration: InputDecoration(
          icon: Icon(Icons.perm_contact_cal),
          suffixIcon: Icon(Icons.calendar_today),
          hintText: 'Seleccione fecha',
          labelText: 'Fecha',
          helperText: 'Una fecha es una fecha',
          counter: Text('Cantidad de caracteres: ${_password.length}')),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _showPicker(context);
      },
    );
  }

  _showPicker(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2023),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _fieldPicker.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> _getDropdownItems() => (_options
      .map((opt) => DropdownMenuItem(
            child: Text(opt),
            value: opt,
           ))
      .toList());

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 15.0),
        Expanded(
          child: DropdownButton(
            value: _selectedOption,
            isExpanded: true,
            items: _getDropdownItems(),
            hint: Text('Selecciona una opcion'),
            onChanged: (opt) {
              setState(() {
                _selectedOption = opt;
              });
            },
          ),
        ),
      ],
    );
  }
}
