gw2 = angular.module 'gw2', ['ngRoute']

gw2.config(['$routeProvider', ($routeProvider) ->
	$routeProvider.when('/map',
		templateUrl: 'partial/map.html'
		controller: MapCtrl
	)
])