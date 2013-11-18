directives = angular.module 'gw2.directives', []

directives
.directive 'sidebar', () ->
  restrict: 'E'
  replace: true
  transclude: true
  templateUrl: 'partials/sidebar.html'
  controller: ($scope) ->
  link: (scope, element, attrs) ->
    element.affix
      offset:
        top: 0
        left: 0
        bottom: 0

.directive 'titlebar', () ->
  restrict: 'E'
  replace: true
  transclude: true
  templateUrl: 'partials/titlebar.html'
  controller: ($scope) ->
    $scope.closeWindow = ->
      chrome.app.window.current().close()

    $scope.minimizeWindow = ->
      currentWindow = chrome.app.window.current()
      if currentWindow.isMinimized()
        currentWindow.restore()
      else
        currentWindow.minimize()

    $scope.maximizeWindow = ->
      currentWindow = chrome.app.window.current()
      if currentWindow.isFullscreen()
        currentWindow.restore()
      else
        currentWindow.fullscreen()
  link: (scope, element, attrs) ->
    chrome.runtime.getPlatformInfo (info) ->
      if info.os == 'mac'
        element.addClass('osx')

.directive 'map', () ->
  restrict: 'E'
  replace: true
  transclude: true
  template: '<div id="map"></div>'
  controller: ($scope) ->
  link: (scope, element, attrs) ->
    map = new google.maps.Map element, {
      zoom: 3
      minZoom: 1
      maxZoom: 7
      center: new google.maps.LatLng 0, 0
      streetViewControl: false
      mapTypeId: '1'
      mapTypeControlOptions: {
        mapTypeIds: ['1', '2']
      }
    }

    get_tile = (coords, zoom) ->
      if coords.y < 0 || coords.x < 0 || coords.y >= (1 << zoom) || coords.x >= (1 << zoom)
        return "http://wiki-de.guildwars2.com/images/6/6f/Kartenhintergrund.png"
      return "https://tiles.guildwars2.com/"+map.getMapTypeId()+'/1/'+zoom+'/'+coords.x+'/'+coords.y+'.jpg'

    tyria = new google.maps.ImageMapType
      maxZoom: 7
      alt: 'Tyria'
      name: 'Tyria'
      tileSize: new google.maps.Size 256, 256
      getTileUrl: get_tile

    mists = new google.maps.ImageMapType
      maxZoom: 6
      alt: "The Mists"
      name: "The Mists"
      tileSize: new google.maps.Size 256, 256
      getTileUrl: get_tile

    map.mapTypes.set('1', tyria)
    map.mapTypes.set('2', mists)




