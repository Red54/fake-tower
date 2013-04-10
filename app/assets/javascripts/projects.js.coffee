project_app = angular.module("Project", ["ngResource"])

project_app.factory "Project", ["$resource", ($resource) ->
	$resource("/projects/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@ProjectCtrl = ["$scope", "Project", ($scope, Project) ->

	$scope.projects = Project.query()

	# $scope.currentProjects = Project.get({id: id})
	
	$scope.addProject = ->
		project = Project.save($scope.newProject)
		$scope.entries.push(project)
]