message_app = angular.module("Message", ["ngResource"])

message_app.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
])

message_app.factory "Message", ["$resource", ($resource) ->
	$resource("/projects/:project_id/messages/:id", 
		{ project_id: location.pathname.split('/')[2], id: "@id"}, 
		{ update: {method: "PUT"}})
]

@MessageCtrl = ["$scope", "Message", ($scope, Message) ->

	$scope.messages = Message.query()

	$scope.addMessage = () ->
		message = Message.save($scope.newMessage)
		$scope.messages.push(message)
		$scope.newMessage = {}

]