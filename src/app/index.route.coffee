angular.module 'iventureFront'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'deuda',
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'
        resolve:
          deudas: (Deuda) ->
            Deuda.find()
              .$promise
              .then (response) ->
                response
      .state 'deuda.equity',
        url: 'equidad'
        templateUrl: 'app/main/equidad.html'
        controller: 'EquityController'
        controllerAs: 'main'
        resolve:
          equidades: (Equidad) ->
            Equidad.find()
              .$promise
              .then (response) ->
                response
      .state 'deuda.prod',
        url: 'prod-financieros'
        templateUrl: 'app/main/prod.html'
        controller: 'FinancController'
        controllerAs: 'main'
        resolve:
          financieros: (Financiero) ->
            Financiero.find()
              .$promise
              .then (response) ->
                response
      .state 'login',
        url: '/login'
        templateUrl: 'app/main/login.html'
        controller: 'LoginController'
        controllerAs: 'login'
      .state 'admin',
        url: '/admin'
        templateUrl: 'app/main/admin.html'
        controller: 'AdminController'
        controllerAs: 'main'
      .state 'admin.category',
        url: '/category/:id/'
        templateUrl: 'app/main/tables.html'
        controller: 'CategoryController'
        controllerAs: 'cat'
        resolve:
          type: ($stateParams) ->
            $stateParams.id
      .state 'admin.category.new',
        url: 'new'
        templateUrl: 'app/main/edit/deuda.html'
        controller: 'NewCategoryController'
        controllerAs: 'cat'
      .state 'admin.category.edit',
        url: ':item'
        templateUrl: 'app/main/edit/deuda.html'
        controller: 'EditCategoryController'
        controllerAs: 'cat'
        resolve:
          type: ($stateParams, Equidad, Financiero, Deuda) ->
            Cat = eval($stateParams.id)
            Cat
              .findById({id: $stateParams.item})
              .$promise
              .then (result) ->
                result
    $urlRouterProvider.otherwise '/'
