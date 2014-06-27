this.sampleApp = angular.module('sampleApp', ['ngResource']);

this.sampleApp.factory("networkProfile", ['$resource', function($resource) {
	return $resource('/network_profiles/:id', {}, {});
}]);

this.sampleApp.factory("trafficProfile", ['$resource', function($resource) {
	return $resource('/traffic_profiles/:id', {}, {});
}]);

this.sampleApp.controller('profileController', ["$scope", "$injector", function($scope, $injector, $resource) {
	
	$scope.service = "";
	$scope.init = function(serviceName)
	{
	    $scope.service = $injector.get(serviceName);
		$scope.ps = $scope.service.query()
	};

	$scope.add = function(name) {
		$scope.service.save({name: $scope.npName});
		$scope.ps = $scope.service.query();
	}

	$scope.delete = function(name) {
		$scope.service.delete({name: $scope.npName});
		$scope.ps = $scope.service.query();
	}
}]);