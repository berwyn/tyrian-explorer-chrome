gw2.directive 'titlebar', () ->
  restrict: 'E'
  replace: true
  transclude: true
  templateUrl: 'partials/titlebar.html'
  controller: ($scope) ->
    $scope.closeWindow = ->
      chrome.app.window.current().close()

    $scope.minimizeWindow = ->
      if chrome.app.window.current().isMinimized()
        chrome.app.window.current().restore()
      else
        chrome.app.window.current().minimize()

    $scope.maximizeWindow = ->
      if chrome.app.window.current().isFullscreen()
        chrome.app.window.current().restore()
      else
        chrome.app.window.current().fullscreen()
  link: (scope, element, attrs) ->
    chrome.runtime.getPlatformInfo (info) ->
      osx = info.os == 'mac'
      cssClass = ''
      if osx
        cssClass = 'osx'
      else
        cssClass = 'windows'
      $('.titlebar').addClass cssClass
      $('a', element).addClass cssClass