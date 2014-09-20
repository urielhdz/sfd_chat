var io = require('socket.io').listen(5001);
var redis = require('redis');
var redis_client = redis.createClient();
var usernames = {};

var sockets = {};
redis_client.subscribe('rt-change');
 

io.on('connection', function(socket){

  redis_client.on('message', function(channel, message){
    var data = JSON.parse(message);

    //io.sockets["in"](data.room).emit('updatechat',data);
    console.log(data);
    io.sockets.emit('rt-change', data);
  });
});