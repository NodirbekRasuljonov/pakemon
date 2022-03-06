import 'package:flutter/material.dart';
import 'package:poxedon/core/components/info_page_spec.dart';
import 'package:poxedon/core/constants/constants.dart';
import 'package:poxedon/models/pokemonmodel.dart';

class IndividualPage extends StatefulWidget {
  Pokemon pokemonsModel;
  IndividualPage({Key? key, required this.pokemonsModel}) : super(key: key);

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 53.0,
                          left: 70.0,
                          right: 70.0,
                          child: Container(
                            height: 88.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/pakemon.png'))),
                          )),
                      Positioned(
                          top: 172.0,
                          left: 24.0,
                          right: 24.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.chevron_left,
                                  color: MyColor.searchbarcolor,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Buscar Pokemon',
                                  style: TextStyle(
                                      color: MyColor.searchbartextcolor),
                                ),
                                height: 42.0,
                                width: 228,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(MyRadius.medium),
                                    color: MyColor.searchbarcolor),
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.tune,
                                  color: MyColor.searchbarcolor,
                                ),
                                onTap: () {},
                              ),
                            ],
                          )),
                    ],
                  ))),
          SliverToBoxAdapter(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.84,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.420,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            height: 260,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Positioned(
                                    child: Container(
                                  height: 40.0,
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "#${widget.pokemonsModel.num.toString()}",
                                        style: TextStyle(
                                            color: MyColor.itemscolor,
                                            fontSize: MySize.small,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        widget.pokemonsModel.name.toString(),
                                        style: TextStyle(
                                            fontSize: MySize.small,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                )),
                                Positioned(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 50.0,
                                    child: Container(
                                      height: 210.0,
                                      width: 371.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              MyRadius.extralarge),
                                          color: MyColor.itemscolor),
                                    )),
                                Positioned(
                                    left: 75.0,
                                    right: 30.0,
                                    bottom: 10.0,
                                    top: .0,
                                    child: Container(
                                      height: 247.0,
                                      width: 289,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(widget
                                                  .pokemonsModel.img
                                                  .toString()))),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 40.0,
                                  width: 150.0,
                                  child: Text(
                                    widget.pokemonsModel.type![0].name,
                                    style: TextStyle(
                                        color: MyColor.itemtextcategorycolor,
                                        fontSize: MySize.small,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          MyRadius.extrasmall),
                                      color: MyColor.itemcategorycolor),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40.0,
                                  width: 150.0,
                                  child: Text(
                                    widget.pokemonsModel.type![0].name,
                                    style: TextStyle(
                                        color: MyColor.itemtextcategorycolor,
                                        fontSize: MySize.small,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          MyRadius.extrasmall),
                                      color: MyColor.itemcategorycolor2
                                          .withOpacity(0.46)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.420,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              InfoSpec(type: 'Height',
                                  info: widget.pokemonsModel.height.toString(),),
                              InfoSpec(type:'Weight',
                                  info:widget.pokemonsModel.weight.toString()),
                              InfoSpec(type:'AVG SPAWN',
                                  info:widget.pokemonsModel.avgSpawns.toString())
                            ],
                          ),
                          Column(
                            children: [
                              InfoSpec(type:'Category',
                                  info:widget.pokemonsModel.id.toString()),
                              InfoSpec(
                                  type:'Egg', info:widget.pokemonsModel.candy!.toString())
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 15.0),
                                height: 120.0,
                                width: 100.0,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Weakness',
                                      style: TextStyle(fontSize: MySize.small),
                                    ),
                                    _text(widget
                                        .pokemonsModel.weaknesses![0].name),
                                    _text(widget
                                        .pokemonsModel.weaknesses![1].name),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(60.0),
                              topRight: Radius.circular(60.0)),
                          color: MyColor.itemscolor),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  
  Text _text(String text) {
    return Text(
      text,
      style: TextStyle(color: MyColor.itemtextcategorycolor.withOpacity(0.56)),
    );
  }
}
