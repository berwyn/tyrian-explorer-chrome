gw2.directive 'titlebar', () ->
  restrict: 'E'
  replace: true
  transclude: true
  templateUrl: 'partials/titlebar.html'
  controller: ($scope) ->
    $scope.closeWinow = ->
      chome.app.window.current().close()

    $scope.minimizeWindow = ->
      if chrome.app.window.current().isMinimized()
        chrome.app.window.current().restore()
      else
        chrome.app.window.current().minimize()

    $scope.maximizeWindow = ->
      if chrome.app.window.current().isMaximized()
        chrome.app.window.current().restore()
      else
        chrome.app.window.current().maximize()
  link: (scope, element, attrs) ->
    chrome.runtime.getPlatformInfo (info) ->
      osx = info.os == 'mac'
      if osx
        $('a', element).addClass 'osx'
        $('#titlebar-nav').addClass 'pull-left'
      else
        $('a', element).addClass 'windows'
        $('#titlebar-nav').addClass 'pull-right'