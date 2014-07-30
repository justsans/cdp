var myApp = angular.module('cdpApp',['ngResource']);

myApp.controller('TabsCtrl', function($scope, $http, $resource){
    var tabClasses;

    function initTabs() {
        tabClasses = ["","","",""];

    }

    $scope.init = function(report_id) {
        $scope.loadTabData(1, report_id);
        $scope.loadTabData(2, report_id);
        $scope.loadTabData(3, report_id);
        $scope.loadTabData(4, report_id);
        $scope.loadTabData(5, report_id);
        $scope.loadTabData(6, report_id);
        $scope.loadTabData(7, report_id);
        $scope.loadTabData(8, report_id);
        $scope.loadTabData(9, report_id);
        $scope.loadTabData(10, report_id);
        $scope.loadTabData(11, report_id);
        $scope.loadTabData(12, report_id);
        $scope.loadTabData(13, report_id);
        $scope.setActiveTab(1);
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

    };

    $scope.loadTabData = function(tabNum, report_id) {
        $resource('/annual_summary_reports/'+ report_id +'/answers.json?section_id='+tabNum, {}, {}).query(function(data) {
            $scope.formData[tabNum] = data;
        });
    }

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