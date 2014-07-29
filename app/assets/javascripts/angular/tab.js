var myApp = angular.module('cdpApp',['ngResource']);

myApp.controller('TabsCtrl', function($scope, $http, $resource){
    var tabClasses;

    function initTabs() {
        tabClasses = ["","","",""];

    }

    $scope.init = function(report_id) {
        $scope.setActiveTab(1, report_id);
    }

    $scope.formData = {}

    $scope.getTabClass = function (tabNum) {
        return tabClasses[tabNum];
    };

    $scope.getTabPaneClass = function (tabNum) {
        return "tab-pane " + tabClasses[tabNum];
    }

    $scope.setActiveTab = function (tabNum, report_id) {
        initTabs();
        tabClasses[tabNum] = "active";
        $resource('/annual_summary_reports/'+ report_id +'/answers.json?section_id='+tabNum, {}, {}).query(function(data) {
            $scope.formData[tabNum] = data;
        });
    };

    $scope.processForm = function(id) {
        $http.post('/annual_summary_reports/'+id+'/answer', $scope.formData)
            .success(function(data) {
//               jQuery('#message').html('Successfully saved.')
            });
    };
    //Initialize
    initTabs();
    $scope.setActiveTab(1);
});