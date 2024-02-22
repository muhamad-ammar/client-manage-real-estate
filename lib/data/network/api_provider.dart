
import 'package:dio/dio.dart';
import '../model/auth.dart';
import 'dio_client.dart';

class ApiProvider {
  final DioClient dioClient;

  ApiProvider({required this.dioClient});

  Future<AuthResponse> authUser(String? login, String? password ) async {
    try {
      final Response response = await dioClient.post(
        "user/login",
        data: {
          "username": login,
          "password": password,
        },
      );
      print(response);
      return AuthResponse.fromJson(response.data);
    } catch (e) {

      rethrow;
    }
  }
}
  //
  // //SignUp
  // Future<AuthResponse> signUpUser(RegisterRequest request) async {
  //   Response response =
  //   await dioClient.post(EndPoints.registration, data: request.toJson());
  //   return AuthResponse.fromJson(response.data);
  // }
  //
  // Future<AuthResponse> verifyOTP(String? code) async {
  //   Response response =
  //   await dioClient.post(EndPoints.verifyOtp, data: {"user_otp": code});
  //   return AuthResponse.fromJson(response.data);
  // }
  //
  // //restorePassword
  // Future<StatusResponse> restorePassword(String? email) async {
  //   Response response =
  //   await dioClient.post(EndPoints.restorePassword, data: {"email": email});
  //   return StatusResponse.fromJson(response.data);
  // }
  //
  // Future<StatusResponse> resetPassword(
  //     String? currentPassword, String? newPassword) async {
  //   Response response = await dioClient
  //       .post(EndPoints.restorePassword, data: {"email": currentPassword});
  //   return StatusResponse.fromJson(response.data);
  // }
  //
  // //getInstructors
  // Future<InstructorsResponse> getInstructors(
  //     Map<String, dynamic> params) async {
  //   Response response =
  //   await dioClient.get(EndPoints.instructors, queryParameters: params);
  //   return InstructorsResponse.fromJson(response.data);
  // }
  //
  // //GetCategories
  // Future<List<CategoryResponse>> getCategories() async {
  //   try {
  //     Response response = await dioClient.get(EndPoints.categories);
  //     return (response.data as List).map((value) {
  //       return CategoryResponse.fromJson(value);
  //     }).toList();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // //GetWebinars
  // Future<WebinarsResponse> getWebinars(Map<String, dynamic> params) async {
  //   try {
  //     final Response response =
  //     await dioClient.get(EndPoints.webinars, queryParameters: params);
  //     return WebinarsResponse.fromJson(response.data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // //GetWebinar
  // Future<Webinar> getWebinarDetail(int id) async {
  //   try {
  //     final Response response = await dioClient.get('${EndPoints.webinar}/$id');
  //     return Webinar.fromJson(response.data["data"]);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // //GetEvents
  // Future<EventsResponse> getEvents(Map<String, dynamic> params) async {
  //   try {
  //     final Response response =
  //     await dioClient.get(EndPoints.events, queryParameters: params);
  //     return EventsResponse.fromJson(response.data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // //GetEvent
  // Future<Event> getEventDetail(int id) async {
  //   try {
  //     final Response response = await dioClient.get('${EndPoints.event}/$id');
  //     return Event.fromJson(response.data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // //GetCourses
  // Future<CoursesResponse> getCourses(Map<String, dynamic> params) async {
  //   try {
  //     final Response response =
  //     await dioClient.get(EndPoints.courses, queryParameters: params);
  //     return CoursesResponse.fromJson(response.data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  // //GetCourses with user token
  // Future<CoursesResponse> getUserHomeCourses(Map<String, dynamic> params) async {
  //   try {
  //     final Response response =
  //     await dioClient.get(EndPoints.courses, queryParameters: params, options:  Options(
  //       headers: {"requirestoken": "true"},
  //     ));
  //     return CoursesResponse.fromJson(response.data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CoursesResponse> getTopCourses() async {
  //   try {
  //     final Response response =
  //     await dioClient.get(
  //         EndPoints.courses,
  //         queryParameters: {"top_courses":"true", "per_page":"10"});
  //     return CoursesResponse.fromJson(response.data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  // // get TopCourses with user token
  // // Future<CoursesResponse> getUserHomeTopCourses() async {
  // //   try {
  // //     final Response response =
  // //         await dioClient.get(
  // //             EndPoints.courses,
  // //             queryParameters: {"top_courses":"true", "per_page":"10"},
  // //             options:  Options(
  // //               headers: {"requirestoken": "true"},
  // //             ));
  // //     return CoursesResponse.fromJson(response.data);
  // //   } catch (e) {
  // //     rethrow;
  // //   }
  // // }
  //
  // //getUserCourses
  // Future<UserCoursesResponse> getUserCourses(
  //     Map<String, dynamic> params) async {
  //   try {
  //     final response = await dioClient.post(EndPoints.userCourses,
  //         queryParameters: params,
  //         options: Options(
  //           headers: {"requirestoken": "true"},
  //         ));
  //     return UserCoursesResponse.fromJson(response.data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // //GetFavouriteCourses
  // Future<CoursesResponse> getFavoriteCourses() async {
  //   Response response = await dioClient.get(
  //     EndPoints.courses,
  //     options: Options(
  //       headers: {"requirestoken": "true"},
  //     ),
  //   );
  //   return CoursesResponse.fromJson(response.data);
  // }
  //
  // //addCourse
  // Future<FavoriteResponse> addFavoriteCourse(int courseId) async {
  //   Response response = await dioClient.put(
  //     EndPoints.favorite,
  //     queryParameters: {"id": courseId},
  //     options: Options(
  //       headers: {"requirestoken": "true"},
  //     ),
  //   );
  //   return FavoriteResponse.fromJson(response.data);
  // }
  //
  // //deleteCourse
  // Future<FavoriteResponse> deleteFavoriteCourse(int courseId) async {
  //   Response response = await dioClient.delete(
  //     EndPoints.favorite,
  //     queryParameters: {"id": courseId},
  //     options: Options(
  //       headers: {"requirestoken": "true"},
  //     ),
  //   );
  //   return FavoriteResponse.fromJson(response.data);
  // }
  //
  // //getCourse
  // Future<Course> getCourseDetail(int id) async {
  //   Response response = await dioClient.get(
  //     EndPoints.course,
  //     queryParameters: {"id": id},
  //   );
  //
  //   return Course.fromJson(response.data);
  // }
  //
  // //getUserCourse
  // Future<Course> getUserCourseDetail(int id) async {
  //   Response response = await dioClient.get(
  //     EndPoints.course,
  //     queryParameters: {"id": id},
  //     options: Options(
  //       headers: {"requirestoken": "true"},
  //     ),
  //   );
  //
  //   return Course.fromJson(response.data);
  // }
  //
  // //getCourseCurriculum
  // Future<CurriculumResponse> getCourseCurriculum(int id) async {
  //   Response response = await dioClient.post(
  //     EndPoints.courseCurriculum,
  //     data: {"id": id},
  //     options: Options(
  //       headers: {"requirestoken": "true"},
  //     ),
  //   );
  //
  //   return CurriculumResponse.fromJson(response.data);
  // }
  //
  // //getReviews
  // Future<ReviewResponse> getReviews(int? id) async {
  //   Response response = await dioClient.get(
  //     EndPoints.courseReviews,
  //     queryParameters: {"id": id},
  //   );
  //
  //   return ReviewResponse.fromJson(response.data);
  // }
  //
  // //addReviews
  // Future<AddReviewResponse> addReview(
  //     int? id, int? mark, String? review) async {
  //   Response response = await dioClient.put(
  //     EndPoints.courseReviews,
  //     queryParameters: {"id": id, "mark": mark, "review": review},
  //     options: Options(
  //       headers: {"requirestoken": "true"},
  //     ),
  //   );
  //
  //   return AddReviewResponse.fromJson(response.data);
  // }
  //
  // //getLesson
  // Future<LessonResponse> getLesson(String? courseId, String? lessonId) async {
  //   Response response = await dioClient.post(EndPoints.getLesson,
  //       data: {"course_id": courseId, "item_id": lessonId},
  //       options: Options(
  //         headers: {"requirestoken": "true"},
  //       ));
  //
  //   return LessonResponse.fromJson(response.data);
  // }
  //
  // //completeLesson
  // Future<StatusResponse> completeLesson(
  //     String? courseId, String? lessonId) async {
  //   Response response = await dioClient.put(EndPoints.completeLesson,
  //       data: {"course_id": courseId, "item_id": lessonId},
  //       options: Options(
  //         headers: {"requirestoken": "true"},
  //       ));
  //
  //   return StatusResponse.fromJson(response.data);
  // }
  //
  // Future<QuizResponse> getQuizResults(
  //     String courseId, String quizId, dynamic quizAnswers) async {
  //   Response response = await dioClient.post(
  //     EndPoints.quizSubmit,
  //     queryParameters: {"course_id": courseId, "quiz_id": quizId},
  //     data: quizAnswers,
  //     options: Options(
  //       headers: {"requirestoken": "true"},
  //     ),
  //   );
  //   return QuizResponse.fromJson(response.data);
  // }
  //
  // //popularSearches
  // Future<PopularSearchesResponse> popularSearches(int limit) async {
  //   Response response = await dioClient
  //       .get(EndPoints.popular_searches, queryParameters: {"limit": limit});
  //   return PopularSearchesResponse.fromJson(response.data);
  // }
  //
  // Future<TokenAuthToCourse> getTokenToCourse(int courseId) async {
  //   Response response = await dioClient.post(
  //     EndPoints.get_auth_token_to_course,
  //     data: {'course_id': courseId},
  //     options: Options(
  //       headers: {"requirestoken": "true"},
  //     ),
  //   );
  //
  //   return TokenAuthToCourse.fromJson(response.data);
  // }
  //
  // //getAccount
  // Future<UserAccount> getAccount({int? accountId}) async {
  //   var params;
  //   if (accountId != null) params = {"id": accountId};
  //   Response response = await dioClient.get(EndPoints.getAccount,
  //       queryParameters: params,
  //       options: Options(
  //         headers: {"requirestoken": "true"},
  //       ));
  //   return UserAccount.fromJson(response.data);
  // }
  // //getAccount
  // Future<DeleteAccount> deleteAccount({int? accountId}) async {
  //   var params;
  //   if (accountId != null) params = {"id": accountId};
  //   var response = await dioClient.delete(EndPoints.deleteAccount,
  //       queryParameters: params,
  //       options: Options(
  //         headers: {"requirestoken": "true"},
  //       ));
  //   // return response;
  //   return DeleteAccount.fromJson(response);
  // }
  //
  // //editProfile
  // Future editProfile(RegisterRequest meta) async {
  //   FormData formData = FormData.fromMap({
  //     "file": Utils.isNetworkImage(meta.image!)
  //         ? null
  //         : await MultipartFile.fromFile(meta.image!,
  //         filename: meta.image!.split('/').last),
  //     "login": meta.login,
  //     "first_name": meta.firstName,
  //     "last_name": meta.lastName,
  //     "email": meta.email,
  //     "user_country": meta.country,
  //     "user_gender": meta.gender,
  //     "user_emp_status": meta.employmentStatus,
  //   });
  //   final response = await dioClient.post(EndPoints.editProfile,
  //       data: formData,
  //       options: Options(
  //         headers: {"requirestoken": "true"},
  //       ));
  //   return UserAccount.fromJson(response.data);
  // }
  //
  // //changePassword
  // Future<ChangePasswordResponse> changePassword(
  //     String oldPassword,
  //     String newPassword,
  //     ) async {
  //   final params = {
  //     'old_password': oldPassword,
  //     'new_password': newPassword,
  //   };
  //   final response = await dioClient.post(EndPoints.editProfile,
  //       queryParameters: params,
  //       options: Options(
  //         headers: {"requirestoken": "true"},
  //       ));
  //   return ChangePasswordResponse.fromJson(response.data);
  // }
  //
  // //enrollCourse
  // Future enrollCourse(int id) async {
  //   Response response = await dioClient.post(EndPoints.enrollCourse,
  //       queryParameters: {"course_id": id},
  //       options: Options(
  //         headers: {"requirestoken": "true"},
  //       ));
  //
  //   return response.data;
  // }
  //
  // //getUserChats
  // Future<ChatResponse> getUserChats() async {
  //   Response response = await dioClient.get(EndPoints.chats,
  //       options: Options(
  //         headers: {"requirestoken": "true"},
  //       ));
  //   return ChatResponse.fromJson(response.data);
  // }
  //
  // //getUserChats
  // Future<ChatResponse> getChatMessages(int id) async {
  //   Response response = await dioClient.get(EndPoints.chats,
  //       queryParameters: {"chat_id": id},
  //       options: Options(
  //         headers: {"requirestoken": "true"},
  //       ));
  //   return ChatResponse.fromJson(response.data);
  // }
  //
  // Future<List<Certificate>> getUserCertificates() async {
  //   Response response = await dioClient.post(EndPoints.certificates,
  //       options: Options(
  //         headers: {"requirestoken": "true"},
  //       ));
  //   return (response.data as List).map((value) {
  //     return Certificate.fromJson(value);
  //   }).toList();
  // }
  //
  // Future<dynamic> getVideo(id) async {
  //   Response response = await dioClient.get('${Strings.vimeoApi}/$id',
  //       options: Options(
  //         headers: {"authorization": "Bearer ${dotenv.env['VimeoToken']}"},
  //       ));
  //   if (response.data != null) {
  //     return response.data['files'][response.data['files'].length-1]['link'];
  //   }
  //   return null;
  // }

/*
  //GetAppSettings
  Future<AppSettings> getAppSettings() async {
    Response response = await _dio.get(apiEndpoint + "app_settings/");
    return AppSettings.fromJson(response.data);
  }

  //uploadProfilePhoto
  Future<Response> uploadProfilePhoto(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    Response response = await dio.post(
      apiEndpoint + "account/edit_profile/",
      data: formData,
      options: Options(
        headers: {"requirestoken": "true"},
      ),
    );

    return response;
  }

  //getCourse
  Future<CourseDetailResponse> getCourse(int id) async {
    Response response = await dio.get(
      apiEndpoint + "course",
      queryParameters: {"id": id},
      options: Options(
        headers: {"requirestoken": "true"},
      ),
    );

    return CourseDetailResponse.fromJson(response.data);
  }

  //getReviews
  Future<ReviewResponse> getReviews(int id) async {
    Response response = await _dio.get(
      apiEndpoint + "course_reviews",
      queryParameters: {"id": id},
    );
    return ReviewResponse.fromJson(response.data);
  }

  //addReviews
  Future<ReviewAddResponse> addReviews(int id, int mark, String review) async {
    Response response = await dio.put(apiEndpoint + "course_reviews",
        queryParameters: {"id": id, "mark": mark, "review": review},
        options: Options(
          headers: {"requirestoken": "true"},
        ));

    return ReviewAddResponse.fromJson(response.data);
  }

  //getCourseCurriculum
  Future<CurriculumResponse> getCourseCurriculum(int id) async {
    Response response = await dio.post(apiEndpoint + "course_curriculum",
        data: {"id": id},
        options: Options(
          headers: {"requirestoken": "true"},
        ));

    return CurriculumResponse.fromJson(response.data);
  }

  //getAssignmentInfo
  Future<AssignmentResponse> getAssignmentInfo(int course_id, int assignment_id) async {
    Map<String, int> map = {
      "course_id": course_id,
      "assignment_id": assignment_id,
    };

    Response response = await dio.post(apiEndpoint + "assignment",
        data: map,
        options: Options(
          headers: {"requirestoken": "true"},
        ));

    return AssignmentResponse.fromJson(response.data);
  }

  //startAssignment
  Future<AssignmentResponse> startAssignment(int course_id, int assignment_id) async {
    Map<String, int> map = {
      "course_id": course_id,
      "assignment_id": assignment_id,
    };

    Response response = await dio.put(apiEndpoint + "assignment/start",
        data: map,
        options: Options(
          headers: {"requirestoken": "true"},
        ));

    return AssignmentResponse.fromJson(response.data);
  }

  //addAssignment
  Future<AssignmentResponse> addAssignment(int course_id, int user_assignment_id, String content) async {
    Map<String, dynamic> map = {
      "course_id": course_id,
      "user_assignment_id": user_assignment_id,
      "content": content,
    };

    Response response = await dio.post(apiEndpoint + "assignment/add",
        data: map,
        options: Options(
          headers: {"requirestoken": "true"},
        ));

    return AssignmentResponse.fromJson(response.data);
  }

  //uploadAssignmentFile
  Future<String> uploadAssignmentFile(int course_id, int user_assignment_id, File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "course_id": course_id,
      "user_assignment_id": user_assignment_id,
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    Response response = await dio.post(apiEndpoint + "assignment/add/file",
        data: formData,
        options: Options(
          headers: {"requirestoken": "true"},
        ));
    return response.toString();
  }

  //getLesson
  Future<LessonResponse> getLesson(dynamic courseId, dynamic lessonId) async {
    Response response = await dio.post(apiEndpoint + "course/lesson",
        data: {"course_id": courseId, "item_id": lessonId},
        options: Options(
          headers: {"requirestoken": "true"},
        ));

    return LessonResponse.fromJson(response.data);
  }

  //completeLesson
  Future completeLesson(int courseId, int lessonId) async {
    Response response = await dio.put(apiEndpoint + "course/lesson/complete",
        data: {"course_id": courseId, "item_id": lessonId},
        options: Options(
          headers: {"requirestoken": "true"},
        ));
    return;
  }

  //getQuiz
  Future<LessonResponse> getQuiz(int courseId, int lessonId) async {
    Response response = await dio.post(apiEndpoint + "course/quiz",
        data: {"course_id": courseId, "item_id": lessonId},
        options: Options(
          headers: {"requirestoken": "true"},
        ));
    return LessonResponse.fromJson(response.data);
  }

  //getQuestions
  Future<QuestionsResponse> getQuestions(int lessonId, int page, String search, String authorIn) async {
    Map<String, dynamic> map = {
      "id": lessonId,
      "page": page,
    };

    if (search != "") map['search'] = search;
    if (authorIn != "") map['author__in'] = authorIn;

    Response response = await dio.post(apiEndpoint + "lesson/questions",
        data: map,
        options: Options(
          headers: {"requirestoken": "true"},
        ));

    return QuestionsResponse.fromJson(response.data);
  }

  //addQuestion
  Future<QuestionAddResponse> addQuestion(int lessonId, String comment, int parent) async {
    late Response response;
    var data = {
      'id': lessonId,
      'comment': comment,
      'parent': parent,
    };

    response = await dio.put(
      apiEndpoint + "lesson/questions",
      data: data,
      options: Options(
        headers: {"requirestoken": "true"},
      ),
    );

    return QuestionAddResponse.fromJson(response.data);
  }



  //getUserPlans
  Future<UserPlansResponse?> getUserPlans(int courseId) async {
    Response response = await dio.post(apiEndpoint + "user_plans",
        data: {'course_id': courseId},
        options: Options(
          headers: {"requirestoken": "true"},
        ));

    if(response.data.isEmpty) {
      return null;
    }else {
      return UserPlansResponse.fromJson(response.data);
    }
  }

  //getPlans
  Future<AllPlansResponse> getPlans(int courseId) async {
    log(courseId.toString());
    Response response = await dio.get(apiEndpoint + "plans",
        queryParameters: {'course_id': courseId},
        options: Options(
          headers: {"requirestoken": "true"},
        ));

    log(response.data.toString());
    return AllPlansResponse.fromJsonArray(response.data);
  }

  //getOrders
  Future<OrdersResponse> getOrders() async {
    Response response = await dio.post(apiEndpoint + "user_orders",
        options: Options(
          headers: {"requirestoken": "true"},
        ));
    return OrdersResponse.fromJson(response.data);
  }

  //addToCart
  Future<AddToCartResponse> addToCart(int courseId) async {
    Response response = await dio.put(apiEndpoint + "add_to_cart",
        data: {"id": courseId},
        options: Options(
          headers: {"requirestoken": "true"},
        ));
    return AddToCartResponse.fromJson(response.data);
  }

  //usePlan
  Future<bool?> usePlan(int courseId, int subscriptionId) async {
    Response response = await dio.put(apiEndpoint + "use_plan",
        queryParameters: {"course_id": courseId, "subscription_id": subscriptionId},
        options: Options(
          headers: {"requirestoken": "true"},
        ));

    if (response.statusCode == 200) return true;
    return null;
  }

  //getLocalization
  Future<Map<String, dynamic>> getLocalization() async {
    var data = await _dio.get(apiEndpoint + "translations");
    if (data.statusCode == 200) return Future.value(data.data);
    return Future.error("");
  }

  //getCourseResults
  Future<FinalResponse> getCourseResults(int courseId) async {
    Response response = await dio.post(
      apiEndpoint + "course/results",
      data: {"course_id": courseId},
      options: Options(
        headers: {"requirestoken": "true"},
      ),
    );
    return FinalResponse.fromJson(response.data);
  }

  //demoAuth
  Future<String> demoAuth() async {
    Response response = await _dio.get(
      apiEndpoint + "demo",
    );
    return response.data['token'];
  }

  //restorePassword
  Future<Response> restorePassword(String email) async {
    Response response = await _dio.post(apiEndpoint + "account/restore_password", data: {"email": email});
    return response;
  }



*/

