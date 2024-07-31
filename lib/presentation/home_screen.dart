import 'package:ambitionguru_task/presentation/provider.dart';
import 'package:ambitionguru_task/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).fetchData();
  }

  bool obscureAmount = false;

  @override
  Widget build(BuildContext context) {
    // final connectivityService = Provider.of<ConnectivityService>(context);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: Text(
            "List Data",
            style: CustomTextStyles.titleSmallSemiBold,
          )),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Consumer<DataProvider>(
                    builder: (context, dataProvider, child) {
                      if (dataProvider.isLoading) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            itemCount: dataProvider.data.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      dataProvider
                                          .data[index].thumbnails!.path!,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            dataProvider.data[index].title!,
                                            style: CustomTextStyles.title)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        dataProvider.data[index].description!,
                                        style: const TextStyle(color: Colors.grey),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Category: ${dataProvider.data[index].category!.name!} (${dataProvider.data[index].category!.description!})',
                                        style: CustomTextStyles.bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
