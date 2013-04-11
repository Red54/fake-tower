var io = require('socket.io').listen(5001),
    redis = require('redis').createClient();

redis.subscribe('message-comment');

io.on('connection', function(socket){
  redis.on('message', function(channel, message){
    socket.emit('message-comment', JSON.parse(message));
  });
});