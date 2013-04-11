var io = require('socket.io').listen(5001),
    redis = require('redis').createClient();

redis.subscribe('message-comment');

io.on('connection', function(socket){
  redis.on('message', function(channel, message){

  	var data = JSON.parse(message);
  	var message_id = data.message_id;
  	var comment = data.comment;

    socket.emit('message-comment-' + message_id, comment);
  });
});