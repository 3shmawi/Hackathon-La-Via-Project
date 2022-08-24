class EndPoint {
  ///auth
  static const String loginWithEmail = 'api/v1/auth/signin';
  static const String loginWithGoogle = 'api/v1/auth/google';
  static const String loginWithFacebook = 'api/v1/auth/facebook';
  static const String signUp = 'api/v1/auth/signup';
  static const String forgetPassword = 'api/v1/auth/forget-password';
  static const String verifyOTP = 'api/v1/auth/verify-otp';
  static const String resetPassword = 'api/v1/auth/reset-password';

  ///seeds
  static const String insertSeed = 'api/v1/seeds';
  static const String fetchSeed = 'api/v1/seeds/:seedId';
  static const String fetchPlants = 'api/v1/seeds';

  ///tools
  static const String insertTools = 'api/v1/tools';
  static const String fetchTools = 'api/v1/tools';

  static String fetchToolsById(int id) {
    return 'api/v1/tools/$id';
  }

  ///plants
  static const String insertPlant = 'api/v1/plants';
  static const String fetchPlant = 'api/v1/plants';
  static String fetchPlantsById(int id) {
    return 'api/v1/plants/$id';
  }

  ///products
  //blogs
  static const String fetchAllBlogs = 'api/v1/products/blogs';
  static const String fetchProductBlogs = 'api/v1/products/blogs/:id';

//**
  static const String insertProduct = 'api/v1/products';
  static const String fetchProduct = 'api/v1/products';
  static const String getFilters = 'api/v1/products/filters';
  static const String fetchOne = 'api/v1/products/:productId';
  static const String buyProduct = 'api/v1/products/buy';

  ///user
  //me
  static const String getCurrentUser = 'api/v1/user/me';
  static const String updateCurrentUser = 'api/v1/user/me';
  static const String claimFreeSeeds = 'api/v1/user/me/claimFreeSeeds';

//**
  static const String getReciept = 'api/v1/user/reciepts/:recieptId';

  ///forums
  //forum id
  static const String getForumById = 'api/v1/forums/:forumId';
  static const String createForumComment = 'api/v1/forums/:forumId/comment';
  static const String likeForum = 'api/v1/forums/:forumId/like';

//**
  static const String getForums =
      'api/v1/forums?search=magna ipsum nisi aliquip';
  static const String createForumPost = 'api/v1/forums';
  static const String getMyForums = 'api/v1/forums/me';

  ///test token**
  static const String token ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJlYjllNzU0ZS01NDI3LTQzNTYtODU5MS1lYzAxNzcwNWZlMWUiLCJpYXQiOjE2NjEzMTc4MDgsImV4cCI6MTY2MTQ5MDYwOH0.t6DFZRvZndj65XMN0DaTuhlOn_D-RnkLprFSSGEvSSs';
}
