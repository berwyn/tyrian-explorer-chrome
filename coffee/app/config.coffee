gw2.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when '/maps',
    templateUrl: 'partials/map.html'
    controller: MapCtrl
]