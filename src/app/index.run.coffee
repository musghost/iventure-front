angular.module 'iventureFront'
  .run ($rootScope, $state, User) ->
    'ngInject'
    $rootScope.$on '$stateChangeStart', (e, toState) ->
      admin = toState.name.split('.')[0]

      if admin == 'admin' && !User.isAuthenticated()
        e.preventDefault()
        $state.go 'login'