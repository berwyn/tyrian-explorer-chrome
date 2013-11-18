directives = angular.module 'gw2.directives', []

directives.directive 'sidebar', () ->
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

directives.directive 'titlebar', () ->
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