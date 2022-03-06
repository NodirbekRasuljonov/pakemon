import 'package:flutter/material.dart';
import 'package:poxedon/core/constants/constants.dart';
import 'package:poxedon/models/pokemonmodel.dart';
import 'package:poxedon/services/myservice.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                                image: AssetImage('assets/images/pakemon.png'),
                              ),
                            ),
                          )),
                      Positioned(
                        top: 172.0,
                        left: 70.0,
                        right: 70.0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Buscar Pokemon',
                            style: TextStyle(color: MyColor.searchbartextcolor),
                          ),
                          height: 42.0,
                          width: 296,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(MyRadius.medium),
                              color: MyColor.searchbarcolor),
                        ),
                      ),
                    ],
                  ))),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return FutureBuilder(
                  future: MyService.getData(),
                  builder: (context, AsyncSnapshot<PokemonsModel> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Xato'),
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/individual',
                              arguments: snapshot.data!.pokemon![index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          height: 149.0,
                          width: 177.0,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Container(
                                  height: 150.0,
                                  width: 177.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(MyRadius.medium),
                                    color: MyColor.itemscolor,
                                  ),
                                ),
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                              ),
                              Positioned(
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "#${snapshot.data!.pokemon![index].num.toString()}",
                                        style: TextStyle(
                                            color: MyColor.itemscolor),
                                      ),
                                      Text(
                                        snapshot.data!.pokemon![index].name
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                  ),
                                  height: 30.0,
                                  width: 147.0,
                                  decoration: BoxDecoration(
                                    color: MyColor.itemcontainercolor,
                                    borderRadius: BorderRadius.circular(
                                        MyRadius.extrasmall),
                                  ),
                                ),
                                bottom: 12.0,
                                left: 14.0,
                                right: 14.0,
                              ),
                              Positioned(
                                child: Container(
                                  height: 150.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(snapshot
                                            .data!.pokemon![index].img
                                            .toString()),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                bottom: 59.0,
                                left: 20.0,
                                right: 20.0,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  });
            }, childCount: 100),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 220.0),
          ),
        ],
      ),
    );
  }
}
