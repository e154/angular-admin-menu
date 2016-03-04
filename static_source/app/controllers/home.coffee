'use strict'

angular
  .module('appControllers')
  .controller 'homeCtrl', ['$scope', 'mainMenuTree'
  ($scope, mainMenuTree) ->
    vm = this
    vm.mainMenu = mainMenuTree

    console.log 'home ctrl'
  ]