gw2 = angular.module 'gw2', ['ngRoute']

$ ->
  $('.side-nav').affix
    offset:
      top: 0
      left: 0
      bottom: 0