var myApp = angular.module('cdpApp',['ngResource']);

myApp.controller('TabsCtrl', function($scope, $resource){
    var tabClasses;

    function initTabs() {
        tabClasses = ["","","",""];

    }

    $scope.questions = [];

    $scope.getTabClass = function (tabNum) {
        return tabClasses[tabNum];
    };

    $scope.getTabPaneClass = function (tabNum) {
        return "tab-pane " + tabClasses[tabNum];
    }

    $scope.setActiveTab = function (tabNum) {
        initTabs();
        tabClasses[tabNum] = "active";
    };

    $resource('/questions.json', {}, {}).query(function(data) {
        $scope.questions[0] = data;
//        alert(data[0].id);
    });



    //Initialize
    initTabs();
    $scope.setActiveTab(1);
});