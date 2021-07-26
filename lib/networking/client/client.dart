import 'dart:io';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart' as http;
import 'package:retrofit_networking/networking/models/responses/get_comments.dart';
import 'package:retrofit_networking/networking/models/responses/get_user.dart';
import 'package:retrofit_networking/networking/models/responses/get_users.dart';
import 'package:retrofit_networking/networking/models/user.dart';

part 'client.g.dart';

const key =
    'Bearer ff4fd8240cf758b51b2971c3d96736bba5f3b5838be52828a778f60295b4d935';

// *** CLIENT *** //
@RestApi(baseUrl: "https://gorest.co.in/public/v1/")
abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  // ===== GET ===== //
  @GET('users')
  Future<GetUsersResponse> getUsers();

  // Get using @Path
  @GET('users/{id}')
  Future<GetUserResponse> getUserWithId(@Path("id") int id);

  //Get using @query
  @GET('comments')
  Future<GetCommentsResponse> getPostComments(@Query("post_id") int postId);

  @GET('comments')
  Future<GetCommentsResponse> getPostCommentsWithQueryMap(
    @Queries() Map<String, dynamic> queries,
  );

  // ===== POST ===== //
  //   const key =
  //    'Bearer ff4fd8240cf758b51b2971c3d96556bba5f3b5838be52828a778f60246b4d935';
  @POST("users")
  @http.Headers(<String, dynamic>{
    HttpHeaders.authorizationHeader: key,
  })
  Future<GetUserResponse> createUser(@Body() User user);

  // ===== PUT / PATCH ===== //
  @PUT("users/{id}")
  @http.Headers(<String, dynamic>{
    HttpHeaders.authorizationHeader: key,
  })
  Future<GetUserResponse> updateUser(@Path() String id, @Body() User user);

  // ===== DELETE ===== //
  @DELETE('users/{id}')
  @http.Headers(<String, dynamic>{
    HttpHeaders.authorizationHeader: key,
  })
  Future<void> deleteUser(@Path("id") int id);
}
