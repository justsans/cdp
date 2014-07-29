var myApp = angular.module('cdpApp',['ngResource']);

myApp.controller('TabsCtrl', function($scope, $resource){
    var tabClasses;

    function initTabs() {
        tabClasses = ["","","",""];

    }

    $scope.formData = {}

    $scope.getTabClass = function (tabNum) {
        return tabClasses[tabNum];
    };

    $scope.getTabPaneClass = function (tabNum) {
        return "tab-pane " + tabClasses[tabNum];
    }

    $scope.setActiveTab = function (tabNum) {
        initTabs();
        tabClasses[tabNum] = "active";
        $resource('/annual_summary_reports/'+ 13 +'/answers.json?section_id='+tabNum, {}, {}).query(function(data) {
            $scope.formData[tabNum] = data;
        });
    };


    //Initialize
    initTabs();
    $scope.setActiveTab(1);
});