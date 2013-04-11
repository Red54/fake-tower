angular.element(document).ready ->  
    angular.bootstrap(document.getElementById('message-bar'), ['Message'])
    angular.bootstrap(document.getElementById('task-bar'), ['TaskList'])