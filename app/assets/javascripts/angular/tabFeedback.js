
angular.module('cdpApp').controller('FeedbackTabCtrl', function($scope, $resource, $filter, ngTableParams){
    var tabClasses;

    function initTabs() {
        tabClasses = ["","","",""];
    }

    var feedbacks = [];
    $scope.feedbacks = [];
    $scope.pending_feedbacks = [];
    $scope.loadFeedbacks = function() {
            $resource('/feedbacks.json', {}, {}).query(function(data) {
                $scope.feedbacks = [];
                for(var i = 0; i < data.length; i++) {
                    var feedback = data[i];
                    $scope.feedbacks.push({name: feedback.from_user_name,
                        email: feedback.from_user_email,
                        role: feedback.from_user_role,
                        id: feedback.id,
                        status_id: feedback.status_id,
                        project: feedback.project,
                        date: feedback.date}) ;
                }

                for(feedback in $scope.feedbacks) {
                    feedbacks.push({"name": feedback.name,
                        "email": feedback.email,
                        "role": feedback.role,
                        "id": feedback.id,
                        "status_id": feedback.status_id,
                        "project": feedback.project,
                        "date_requested": feedback.date_requested}) ;
                }
            });

    };

    $scope.loadPendingFeedbacks = function() {
        $resource('/feedbacks/pending.json', {}, {}).query(function(data) {
            feedbacks = data;
            $scope.pending_feedbacks = [];
            for(var i = 0; i < feedbacks.length; i++) {
                var feedback = feedbacks[i];
                $scope.pending_feedbacks.push({"name": feedback.from_user_name,
                    "email": feedback.from_user_email,
                    "role": feedback.from_user_role,
                    "id": feedback.id,
                    "status_id": feedback.status_id,
                    "project": feedback.project,
                    "date_requested": feedback.date_requested})  ;
            }

        });

    };

    $scope.getTabClass = function (tabNum) {
        return tabClasses[tabNum];
    };

    $scope.getTabPaneClass = function (tabNum) {
        return "tab-pane " + tabClasses[tabNum];
    }

    $scope.setActiveTab = function (tabNum) {
        initTabs();
        if(tabNum == 1) {
            $scope.loadFeedbacks();
        } else if(tabNum == 2) {
            $scope.loadPendingFeedbacks();
        }
        tabClasses[tabNum] = "active";
    };

    //Initialize
    initTabs();
    $scope.setActiveTab(1);

    $scope.tableParams = new ngTableParams({
        page: 1,            // show first page
        count: 10,          // count per page
        sorting: {
            name: 'asc'     // initial sorting
        }
    }, {
        total: feedbacks.length, // length of data
        getData: function($defer, params) {
            // use build-in angular filter
            var orderedData = params.sorting() ?
                $filter('orderBy')(feedbacks, params.orderBy()) :
                feedbacks;

            $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
        }
    });


    $scope.pendingTableParams = new ngTableParams({
        page: 1,            // show first page
        count: 10,          // count per page
        sorting: {
            name: 'asc'     // initial sorting
        }
    }, {
        total: $scope.pending_feedbacks.length, // length of data
        getData: function($defer, params) {
            // use build-in angular filter
            var orderedData = params.sorting() ?
                $filter('orderBy')($scope.pending_feedbacks, params.orderBy()) :
                $scope.pending_feedbacks;

            $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
        }
    });
});
