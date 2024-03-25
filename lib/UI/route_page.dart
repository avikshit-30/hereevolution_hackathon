import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:herevolution/config_api/config_model.dart';
import 'package:herevolution/config_api/config_repo.dart';
import 'package:herevolution/constants/textstyles.dart';
import 'package:herevolution/utils/api_state_folder.dart';
import 'package:recase/recase.dart';

class RoutePage extends ConsumerWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var configRepo = ref.watch(configRepoProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Route Details'),
        ),
        body: ApiStateFolder(
          repos: [configRepo],
          buildLoaded: () => ListView.builder(
            itemCount: configRepo.currentResult!.routes![0].sections!.length,
            itemBuilder: (BuildContext context, int index) {
              Sections section =
                  configRepo.currentResult!.routes![0].sections![index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Sections',
                      style: w600.size18,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      title: Text('Section ${index + 1} - ${section.type}'),
                      children: [
                        ...section.actions!.map((action) {
                          return ListTile(
                            title: Text(
                              '${action.action!.titleCase}',
                              style: w600.size16.colorBlack,
                            ),
                            subtitle: Text(
                                '${action.instruction}\nLength(m):${action.length}\t\t\tDuration(mins):\t${action.duration}'),
                            // Add more details as needed
                          );
                        }).toList(),
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Summary:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Total Duration in mins: ${section.summary?.duration ?? ''}\nTotal Length in m: ${section.summary?.length ?? ''}',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
