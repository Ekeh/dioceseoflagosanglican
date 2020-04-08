import 'package:anglican_lagos/common/app_consts.dart';

class ApiRequestsUri {
  static const BaseApi = "https://demo3118927.mockable.io/api/";
  static const LoginUrl = BaseApi + 'loginstandard.php';
  static const Register = BaseApi + 'registerStandard.php';
  static const VIDEO_URL = 'https://shufflestv.com/uploads/videos/';
  static const THUMBNAIL_URL = 'https://shufflestv.com/uploads/thumbs/';
  static const GET_CHANNELS = BaseApi + 'getchannelsios.php';
  static const GET_VOTES = BaseApi + 'getQualifiedContestants.php';

  static const GetTrendingVideos =  BaseApi + 'trendingvideosios.php';
  static const SearchVideos =  BaseApi + 'searchvideos.php';
  static const INCREMENT_LIKE =  BaseApi + 'updatelikesStandard.php';
  static const UPDATE_PROFILE =  BaseApi + 'updateProfile.php';
  static const CHANGE_PASSWORD =  BaseApi + 'changePassword.php';
  static const REFRESH_PROFILE =  BaseApi + 'refreshProfile.php';
  static const REFRESH_WALLET =  BaseApi + 'refreshProfile.php';
  static const VOTE_CONTESTANT =  BaseApi + 'voteContestant.php';


}