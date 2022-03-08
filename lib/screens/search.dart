import 'package:flutter/material.dart';
import 'package:poxedon/core/constants/api_const.dart';
import 'package:poxedon/core/constants/constants.dart';
import 'package:poxedon/models/pokemonmodel.dart';
import 'package:poxedon/services/myservice.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MyRadius.medium)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MyRadius.medium))),
          ),
          FutureBuilder(
            future: MyService.getData(),
            builder: (context, AsyncSnapshot<PokemonsModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            } else {
              return Container(
                child: Text(snapshot.data!.pokemon![0].name.toString()),
              );
            }
          })
        ],
      ),
    );
  }
}
// ! desbdhjfbgshjgsdhjgdjhgdhjfgsdhjfgsdjhfsdfh
// ?dhjkhfdkjfhdjsksdjfkhsd
