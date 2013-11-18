ctrls = angular.module 'gw2.ctrls', []

ctrls.controller 'BaseCtrl', ['$scope', ($scope) ->
  $scope.title = 'Tyrian Explorer'
]

ctrls.controller 'MapCtrl', ['$scope', '$routeParams', ($scope, $routeParams) ->

]