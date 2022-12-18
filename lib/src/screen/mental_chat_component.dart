import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_apps/src/riverpod/chat_text_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mental_health_apps/src/riverpod/bottom_tab_provider.dart';
import 'chat_screen_component.dart';

class MentalChatComponent extends StatelessWidget {
  const MentalChatComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer(
                builder: (context, ref, _) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(chatTextProvider).clear();
                      ref.read(mhBottomTabProvider.notifier).state = 0;
                    },
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
              const Text("Cope with Pain"),
              const Icon(Icons.more_horiz)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.green,
                border: Border.all(color: Colors.black, width: 1.5)),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Consumer(
              builder: (context, ref, _) {
                final topTab = ref.watch(mhChatTabProvider);
                return Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ref.read(mhChatTabProvider.notifier).state = 0;
                        },
                        child: topTab == 0
                            ? Container(
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(24)),
                                child: const Center(
                                  child: Text(
                                    "Consult",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "Consult",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ref.read(mhChatTabProvider.notifier).state = 1;
                        },
                        child: topTab == 1
                            ? Container(
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(24)),
                                child: const Center(
                                  child: Text(
                                    "Description",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "Description",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Consumer(builder: (context, ref, _) {
          final topTab = ref.watch(mhChatTabProvider);
          switch (topTab) {
            case 0:
              return const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ChatScreenComponent(),
                ),
              );
            case 1:
              return Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: GoogleFonts.balsamiqSans(
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ));
            default:
              return Container();
          }
        })
      ],
    );
  }
}
