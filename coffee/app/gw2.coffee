gw2 = angular.module 'gw2', ['ngRoute', 'gw2.ctrls', 'gw2.directives']

gw2.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when '/maps',
    templateUrl: 'partials/map.html'
    controller: "MapCtrl"
]