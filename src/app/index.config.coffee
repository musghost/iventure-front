angular.module 'iventureFront'
  .config ($logProvider, toastrConfig, LoopBackResourceProvider, $httpProvider) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true
    # Set options third-party lib
    toastrConfig.allowHtml = true
    toastrConfig.timeOut = 3000
    toastrConfig.positionClass = 'toast-top-right'
    toastrConfig.preventDuplicates = true
    toastrConfig.progressBar = true
    LoopBackResourceProvider.setUrlBase 'http://localhost:3000/api'

    $httpProvider.interceptors.push ($q, $location, LoopBackAuth) ->
      responseError: (rejection) ->
        if rejection.status == 401
          LoopBackAuth.clearUser()
          LoopBackAuth.clearStorage()
          $location.nextAfterLogin = $location.path()
          $location.path '/login'
        $q.reject(rejection)