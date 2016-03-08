#
# author: alex filippov
#
# example:
#

angular
  .module('appServices')
  .directive 'mainMenu', ['$log'
  ($log) ->
    restrict: 'A'
    template: '<script id="main-menu-template" type="text/ng-template" ng-class="{\'has-ul\' : node.children}">
  <li ng-repeat="node in node.children" ng-class="{\'has-ul\' : node.children.length, \'active\': node.active }">
    <a href="#" title="{{::node.name}}" ng-click="goto(node)">
      <span>{{::node.name}}</span>
      <i ng-class="[node.icon]" ng-if="node.icon"></i>
      <span ng-if="node.children.length && !node.active" class="plus">+</span>
      <span ng-if="node.children.length && node.active" class="minus">-</span>
    </a>
    <ul class="hidden-ul" ng-if="node.children.length" ng-include=\'"main-menu-template"\'></ul>
  </li>
</script>

<ul class="main-menu">
  <li ng-repeat="node in mainMenu" ng-class="{\'has-ul\' : node.children.length, \'active\': node.active }">
    <a href="#" title="{{::node.name}}" ng-click="goto(node)">
      <span>{{::node.name}}</span>
      <i ng-class="[node.icon]" ng-if="node.icon"></i>
    </a>
    <ul class="hidden-ul" ng-if="node.children.length" ng-include=\'"main-menu-template"\'></ul>
  </li>
</ul>'
    scope:
      mainMenu: '='
    link: ($scope, $element, $attrs) ->
#      $log.debug $scope.mainMenu

      # обход графа
      setActive =(cn)->

        parents = []
        rev =(nodes)->
          for node in nodes
            if node == cn
              node.active = !node.active
              angular.forEach parents, (parent)->
                parent.active = true
            else
              node.active = false

            if node.children && node.children.length > 0
              parents.push node
              rev(node.children)
              parents.pop()

        rev($scope.mainMenu)


      $scope.goto =(node)->
        setActive(node)

#        if node.sref
#          $state.go node.sref




]
