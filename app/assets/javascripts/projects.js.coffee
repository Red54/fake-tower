project_app = angular.module("Project", ["ngResource"])

project_app.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
])

project_app.factory "Project", ["$resource", ($resource) ->
	$resource("/projects/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@ProjectCtrl = ["$scope", "Project", ($scope, Project) ->

	$scope.projects = Project.query()
	
	$scope.addProject = ->
		project = Project.save($scope.newProject)
		$scope.projects.push(project)
]