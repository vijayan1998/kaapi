import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/apiurl.dart';
import 'package:kappi/src/bloc/login_bloc.dart';
import 'package:kappi/src/bloc/login_event.dart';
import 'package:kappi/src/bloc/login_state.dart';
import 'package:kappi/src/bloc/menu_bloc.dart';
import 'package:kappi/src/bloc/menu_event.dart';
import 'package:kappi/src/bloc/menu_state.dart';
import 'package:kappi/src/respositiory/api_service.dart';
import 'package:kappi/src/views/screens/navigation/order/orderaddscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class ColdScreen extends StatefulWidget {
  const ColdScreen({super.key});

  @override
  State<ColdScreen> createState() => _ColdScreenState();
}

class _ColdScreenState extends State<ColdScreen> {
  String storeid = '';

  @override
  void initState() {
    // get the storeid in userlist
    BlocProvider.of<UserBloc>(context).add(FetchLoginEvent());
    context.read<UserBloc>().stream.listen((state) {
      if (state is FetchLoginSuccessState) {
        setState(() {
          storeid = state.loginModel.store;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        24.vspace,
        BlocProvider(
          create: (_) => MenuBloc(StoreRepository()),
          child: BlocBuilder<MenuBloc, MenuState>(
            builder: (context, state) {
              if (state is FetchMenuInitiState) {
                Future.delayed(
                  Duration(seconds: 1),
                  () => {
                    BlocProvider.of<MenuBloc>(
                      context,
                    ).add(FetchMenuEvent(storeid: storeid)),
                  },
                );
                return Center(child: CircularProgressIndicator());
              } else if (state is FetchMenuLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is FetchMenuSuccessState) {
                final menuhotlist =
                    state.menuModel
                        .where((element) => element.type == 'cold')
                        .toList();
                if(menuhotlist.isEmpty){
                  return Center(child: Text('No Menu',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                  ),),);
                }
                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                  itemCount: menuhotlist.length,
                  itemBuilder: (context, index) {
                    final items = menuhotlist[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            '${Apiurl.apiurl}/uploads/menu/${items.productimg}',
                            height: 56,
                            width: 56,
                          ),
                          16.hspace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                items.productname,
                                style: Theme.of(
                                  context,
                                ).textTheme.titleMedium!.copyWith(
                                  color: Appcolors.appColors.shade100,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  items.description,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleSmall!.copyWith(
                                    color: Appcolors.appColors.shade400,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff423329),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => OrderAddScreen(
                                        productname: items.productname,
                                        productimg: items.productimg,
                                        description: items.description,
                                        price: items.price,
                                        addons: items.addons!,
                                        category: items.category,
                                      ),
                                ),
                              );
                            },
                            child: Text(
                              'Add',
                              style: Theme.of(
                                context,
                              ).textTheme.titleSmall!.copyWith(
                                color: Appcolors.appColors.shade100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is FetchMenuErrorState) {
                return Text(
                  state.message,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: Colors.white),
                );
              }
              return Container();
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '2 items | \$12.50',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff423329),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'View Cart',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.appColors.shade100,
                  ),
                ),
              ),
            ],
          ),
        ),
        16.vspace,
      ],
    );
  }
}
