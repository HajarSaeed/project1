import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssdinterview/core/widgets/no_data_widget.dart';
import 'package:ssdinterview/features/screen1/cubit/screen1_cubit.dart';
import 'package:ssdinterview/features/screen2/screens/screen2.dart';

import '../../../core/models/categories_list_model.dart';
import '../../../core/remote/service.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  @override
  void initState() {
    context.read<Screen1Cubit>().getCategoriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Screen1Cubit, Screen1State>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        Screen1Cubit cubit = context.read<Screen1Cubit>();

       if (state is CategoriesListLoadingState) {
         return const Scaffold(body: Center(child: CircularProgressIndicator()),) ;
       } else if (state is CategoriesListFailureState) {
         return Scaffold(
           body: NoDataWidget(onclick: () {
             cubit.getCategoriesList();
           }, title: "no data"),
         );
       }
       else{
         return Scaffold(
           appBar: AppBar(
             title: const Text("Screen1:GetCategories List Api"),
           ),
           body: SafeArea(
             child: Center(
               child: ListView.builder(
                 padding: const EdgeInsets.all(40),
                 itemCount: cubit.categoriesListModel?.data?.list?.length??0,
                 itemBuilder: (context, index) {
                 return Text("${cubit.categoriesListModel?.data?.list?[index].title}",
                 style: const TextStyle(fontSize: 20,color: Colors.orange),);

               },),
             ),
           ),
           floatingActionButton: FloatingActionButton(
             child: const Icon(Icons.arrow_right_alt),
             onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(),));
             },
           ),
         );
       }
      },
    );
  }
}

