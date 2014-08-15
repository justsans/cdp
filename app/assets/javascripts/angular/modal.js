angular.module('cdpApp', ['ngResource', 'ui.bootstrap', 'ui.bootstrap.tabs', 'ngTable']);

//var myApp = angular.module('modalApp',['ngResource', 'ui.bootstrap']);

angular.module('cdpApp').controller('ModalDemoCtrl',  function ($scope, $modal, $log) {

    $scope.questions = [{"question": ""}];
    $scope.recipients = [{"name": "", "email": '', "role": ''}];
    $scope.custom_message = "Dear Colleague,\n\nI'd like to get feedback from you for my annual report.\n\nThanks & Regards\nSancho";

    $scope.open = function (size) {

        var modalInstance = $modal.open({
            templateUrl: 'feedbackRequestModal.html',
            controller: ModalInstanceCtrl,
            size: size,
            resolve: {
                recipients: function () {
                    return $scope.recipients;
                } ,
                questions: function () {
                    return $scope.questions;
                }  ,
                custom_message: function() {
                    return $scope.custom_message;
                }
            }
        });
    };
});

// Please note that $modalInstance represents a modal window (instance) dependency.
// It is not the same as the $modal service used above.

var ModalInstanceCtrl = function ($scope, $modalInstance, $http, recipients, questions, custom_message) {

    $scope.recipients = recipients;
    $scope.questions = questions;
    $scope.custom_message = custom_message;

    $scope.addQuestion = function() {
        $scope.questions.push({"question": '', "type": 0})
    };

    $scope.addRecipient = function() {
        $scope.recipients.push({"name": "", "email": '', "role": ''});
    };

    $scope.submitFeedbackRequests = function() {
        $http.post('/feedbacks/sendFeedbackRequest', {'recipients': $scope.recipients,
            'questions': $scope.questions,
            'custom_message': $scope.custom_message})
            .success(function(data) {
//               jQuery('#message').html('Successfully saved.')
        });

        $modalInstance.close();
    };

    $scope.cancel = function () {
        $modalInstance.dismiss('cancel');
    };
};