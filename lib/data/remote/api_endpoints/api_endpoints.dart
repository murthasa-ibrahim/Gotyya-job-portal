class ApiEndpoints {
  static const baseUrl = "http://13.235.133.158/";
  static const signUp = "auth/users/";
  static const signIn = "auth/jwt/create/";
  static const logout = "auth/revoke-token";
  static const createProfile = "auth1/profile/createprofile/";
  static const getProfile = "auth1/currentuser/";
  static const createblog = "blog/posts/";
  static const getBlogList = "blog/posts/";
  static const createJob = "jobs/jobposting/";
  static const addComment = "/blog/comment/";
  static const getCategory = "jobs/category/";
  static const getJobList = "jobs/jobposting/";
  static const refreshToken = "auth/jwt/verify/";
  static const addLike = "blog/reaction/";
  static const deleteBlog = "blog/posts/";
}
