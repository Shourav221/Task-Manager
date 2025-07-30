class Urls{
  static const String _baseUrls = 'http://35.73.30.144:2005/api/v1';
  static const String registrationUrls = '$_baseUrls/Registration';
  static const String loginUrls = '$_baseUrls/Login';
  static const String profileUpdateUrls = '$_baseUrls/ProfileUpdate';
  static const String profileDetailsUrls = '$_baseUrls/ProfileDetails';
  static const String createNewTaskUrls = '$_baseUrls/createTask';
  static const String getNewTasksUrls = '$_baseUrls/listTaskByStatus/New';
  static const String getProgressTasksUrls = '$_baseUrls/listTaskByStatus/Progress';

}