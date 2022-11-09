import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:load_image_text/bloc/image_bloc.dart';
import 'package:load_image_text/bloc/image_event.dart';
import 'package:load_image_text/bloc/image_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ImageBloc, ImageState>(
        //BlocListener<ImageBloc, ImageState>(   Just comment above line. BlocConsumer = BlocListener + BlocBuilder
        listener: (context, state) {
          if (state is ImageIsNotLoadState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Image is not loaded"),
              duration: Duration(seconds: 2),
            ));
          }
          if (state is ImageIsLoadState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Image is loaded"),
              duration: Duration(seconds: 2),
            ));
          }
        },
        // child: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          return Stack(
            children: [
              BlocBuilder<ImageBloc, ImageState>(
                builder: (context, state) {
                  if (state is ImageIsLoadState) {
                    return Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 250,
                          ),
                          const Center(child: Text("Masrafi")),
                          SizedBox(
                            height: 50,
                          ),
                          Image.asset("assets/mas.jpg"),
                        ],
                      ),
                    );
                  }
                  if (state is ImageIsNotLoadState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Container();
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ImageBloc>(context)
                            .add(ImageIsLodedEvent());
                      },
                      child: const Text(
                        "Show",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ImageBloc>(context)
                            .add(ImageIsNotLodedEvent());
                        //BlocProvider.of<ImageBloc>(context).add(ImageIsNotLodedEvent());
                      },
                      child: const Text(
                        "Hide",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
        //),
      ),
    );
  }
}
