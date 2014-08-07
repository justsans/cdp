var myApp = angular.module('cdpApp',['ngResource']);

myApp.controller('EnterFeedbackCtrl',function($scope, $http, $resource){

    $scope.questions = [{"question": "", "answer": "", "rating": 0, "id": 0}];
    $scope.addQuestion = function(){
          $scope.questions.push({"question": "", "answer": "", "rating": 0})
    };

    $scope.loadQuestions = function(feedback_id) {
        if(feedback_id != undefined)              {
            $resource('/feedbacks/'+feedback_id+'/feedback_sections.json', {}, {}).query(function(data) {
                feedback_sections = data;
                $scope.questions = [];
                for(var i = 0; i < feedback_sections.length; i++) {
                    var section = feedback_sections[i];
                    $scope.questions.push({"question": section.question, "answer": section.answer, "rating": section.rating, "id": section.id})
                }
            });
        }

    };


//    $scope.processForm = function(id) {
//        $http.post('/annual_summary_reports/'+id+'/answer', $scope.formData)
//            .success(function(data) {
////               jQuery('#message').html('Successfully saved.')
//            });
//    };
});


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