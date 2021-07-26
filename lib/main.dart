import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit_networking/networking/models/comment.dart';
import 'package:retrofit_networking/networking/models/responses/get_comments.dart';
import 'package:retrofit_networking/networking/models/responses/get_user.dart';
import 'package:retrofit_networking/networking/models/user.dart';
import 'package:retrofit_networking/networking/providers/api_client_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
// to set the root of app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: Column(
        children: [
          SelectedUserView(),
          ActionButtonsRow(),
          UsersListView(),
        ],
      ),
    );
  }
}

class SelectedUserView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(userProvider).when(
      data: (userResponse) {
        User _user = userResponse.data;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_user.email),
          ],
        );
      },
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: SizedBox(),
      ),
    );
  }
}

class UsersListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(usersProvider).when(
      data: (userList) {
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context
                    .read(selectedUserProvider.notifier)
                    .update(userList[index].id),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('${userList[index].email}'),
                          Text('${userList[index].name}'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: userList.length,
          ),
        );
      },
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('$error'),
      ),
    );
  }
}

class ActionButtonsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          onPressed: () async {
            try {
              GetCommentsResponse resp =
                  await context.read(apiClientProvider).getPostComments(11);

              List<Comment> comments = resp.data;
              for (var comment in comments) {
                print('Comment : ${comment.body}');
              }
            } catch (e) {
              print('${e.toString()}');
            }
          },
          child: Text('Get Comments'),
        ),
        SizedBox(width: 5),
        MaterialButton(
          onPressed: () async {
            try {
              GetCommentsResponse resp = await context
                  .read(apiClientProvider)
                  .getPostCommentsWithQueryMap({
                'post_id': 3,
                'email': 'deeptimay_iyengar@kautzer.org',
              });

              List<Comment> comments = resp.data;
              for (var comment in comments) {
                print('Comment : ${comment.body}');
              }
            } catch (e) {
              print(e);
            }
          },
          child: Text('Get Comments with Q map'),
        ),
        SizedBox(width: 5),
        MaterialButton(
          onPressed: () async {
            try {
              GetUserResponse resp =
                  await context.read(apiClientProvider).createUser(
                        User(
                          1,
                          'Chris',
                          'chris@gmail.com',
                          'male',
                          'active',
                        ),
                      );
              print(resp.data.toJson());
            } catch (e) {
              print(e);
            }
          },
          child: Text('Create User'),
        ),
        SizedBox(width: 5),
        MaterialButton(
          onPressed: () async {
            try {
              GetUserResponse resp =
                  await context.read(apiClientProvider).updateUser(
                        '1424',
                        User(
                          1424,
                          'chris bl',
                          'chris@gmail.com',
                          'male',
                          'active',
                        ),
                      );
              print(resp.data.toJson());
            } catch (e) {
              print(e);
            }
          },
          child: Text('Update User'),
        ),
        SizedBox(width: 5),
        MaterialButton(
          onPressed: () async {
            try {
              await context
                  .read(apiClientProvider)
                  .deleteUser(1424)
                  .then((value) => print('succcess deleting user'));
            } catch (e) {
              print(e);
            }
          },
          child: Text('Delete User'),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
