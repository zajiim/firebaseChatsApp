import 'package:chat_app_riverpod/application/select_contacts/select_contacts_controller.dart';
import 'package:chat_app_riverpod/presentation/common/widgets/error_widget.dart';
import 'package:chat_app_riverpod/presentation/common/widgets/loader_widget.dart';
import "package:flutter/material.dart";
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectContactsScreen extends ConsumerWidget {
  static const String routeName = '/select-contact';
  const SelectContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select contact',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: ref.watch(getContactsProvider).when(
            data: (contactList) => ListView.builder(
                itemCount: contactList.length,
                itemBuilder: ((context, index) {
                  final contact = contactList[index];
                  return InkWell(
                    onTap: () => selectContact(ref, contact, context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: ListTile(
                        title: Text(
                          contact.displayName,
                          style: const TextStyle(fontSize: 18),
                        ),  
                        leading: (contact.photo == null)
                            ? null
                            : CircleAvatar(
                                backgroundImage: MemoryImage(contact.photo!),
                                radius: 30,
                              ),
                      ),
                    ),
                  );
                })),
            error: ((error, stackTrace) => ErrorScreenWidget(
                  error: error.toString(),
                )),
            loading: () => const LoaderScreenWidget(),
          ),
    );
  }

  void selectContact(
      WidgetRef ref, Contact selectedContact, BuildContext context) {
    ref
        .read(selectContactControllerProvider)
        .selectContact(selectedContact, context);
  }
}
