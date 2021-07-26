import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit_networking/networking/client/client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_networking/networking/models/responses/get_user.dart';
import 'package:retrofit_networking/networking/models/user.dart';
import 'package:retrofit_networking/networking/models/responses/get_users.dart';

final apiClientProvider = Provider<APIClient>(
  (ref) => APIClient(
    Dio(
      BaseOptions(contentType: "application/json"),
    ),
  ),
);

//--------------------------------------------------------------------------------//

final usersProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  final APIClient _client = ref.watch(apiClientProvider);
  try {
    GetUsersResponse resp = await _client.getUsers();
    return resp.data;
  } catch (e) {
    print(e);
  }
  return <User>[];
});

//--------------------------------------------------------------------------------//

// Select a individual user from list
final selectedUserProvider =
    StateNotifierProvider<SelectedUser, int>((ref) => SelectedUser());

class SelectedUser extends StateNotifier<int> {
  SelectedUser() : super(-1);

  void update(int id) => state = id;
}

// Return selected User
final userProvider = FutureProvider.autoDispose<GetUserResponse>((ref) async {
  final APIClient _client = ref.watch(apiClientProvider);
  return await _client.getUserWithId(ref.watch(selectedUserProvider));
});
