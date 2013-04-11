task_list_app = angular.module("TaskList", ["ngResource"])

task_list_app.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
])

task_list_app.factory "TaskList", ["$resource", ($resource) ->
	$resource("/projects/:project_id/task_lists/:id", 
		{ 
			project_id: location.pathname.split('/')[2], 
			id: "@id"
		}, 
		{ update: {method: "PUT"}})
]

@TaskListCtrl = ["$scope", "TaskList", ($scope, TaskList) ->

	$scope.task_lists = TaskList.query()
	
	$scope.add_task_list = ->
		task_list = TaskList.save($scope.newTaskList, ->
			$scope.task_lists.push task_list
			$scope.newTaskList = {}
			)
]