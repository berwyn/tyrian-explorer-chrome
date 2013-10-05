gw2.directive 'titlebar', () ->
  restrict: 'E'
  replace: true
  transclude: true
  templateUrl: 'partials/titlebar.html'
  scope:
    closeClick: '&'
    minClick: '&'
    maxClick: '&'
  link: (scope, element, attrs) ->
    chrome.runtime.getPlatformInfo (info) ->
      osx = info.os == 'mac'
      if osx
        $('a', element).addClass 'osx'
      else
        $('a', element).addClass 'windows'