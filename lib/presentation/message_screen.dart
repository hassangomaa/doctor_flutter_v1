import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../core/network/dio_helper.dart';
import '../core/services/cache/app_cache_key.dart';
import '../core/services/cache/cache_service.dart';
import '../model/contact_us_list_model.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Future<ListContactUs> getUserMdedicin() async {
    Response response = await DioHelper.getData(
        url: '/contact-us/list',
        token: CacheService.getString(key: AppCacheKey.token) ?? '');
    return ListContactUs.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "message",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<ListContactUs>(
          future: getUserMdedicin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: "name",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              text: snapshot.data!.data![index].name!,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "email",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              text: snapshot.data!.data![index].email!,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "subject",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              text: snapshot.data!.data![index].subject!,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}