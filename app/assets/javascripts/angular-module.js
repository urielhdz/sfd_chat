angular.module('ChatSFD',["ngResource"])
.controller('ChatController',["$scope","$resource",function($scope,$resource){
		ChatMessage = $resource("/chat_messages/:id.json", {id: "@id"},{update: {method: "PUT"}});
		$scope.chat_messages = ChatMessage.query();
		$scope.new_chat_message = {};
		$scope.socket = io.connect('http://localhost:5001');
		$scope.socket.on('rt-change',function(data){
			//console.log(data);
			console.log($scope.chat_messages.length);
			if(!$("#"+data.obj.id).length){
				$scope.chat_messages.unshift(data.obj);
				$scope.$apply();	
			}
			
		});
		
		$scope.addMessage = function(){
			ChatMessage.save($scope.new_chat_message);
			$scope.new_chat_message = {};
		}
	}
]);