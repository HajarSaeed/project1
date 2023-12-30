import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/no_data_widget.dart';
import '../../mashaweir/screens/mashaweir_screen.dart';
import '../cubit/screen2_cubit.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  void initState() {
    context.read<Screen2Cubit>().getListByCategoriesId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Screen2Cubit, Screen2State>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        Screen2Cubit cubit = context.read<Screen2Cubit>();

        if (state is ListLoadingState) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()),) ;
        } else if (state is ListFailureState) {
          return Scaffold(
            body: NoDataWidget(onclick: () {
              cubit.getListByCategoriesId();
            }, title: "no data"),
          );
        }
        else{
          return Scaffold(
            appBar: AppBar(
              title: const Text("Screen2:Get List by categories id  Api"),
            ),
            body: SafeArea(
              child: Center(
                child: ListView.builder(
                  padding: const EdgeInsets.all(40),
                  itemCount: cubit.listByCategoriesIdModel?.data?.list?.length??0,
                  itemBuilder: (context, index) {
                    return Text("${cubit.listByCategoriesIdModel?.data?.list?[index].title}",
                      style: const TextStyle(fontSize: 20,color: Colors.orange),);

                  },),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.arrow_right_alt),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MashaweirScreen(),));
              },
            ),
          );
        }
      },
    );
  }
}
