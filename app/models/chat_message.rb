class ChatMessage < ActiveRecord::Base
	after_create {|chat_message| chat_message.redis_message 'create' }
	

	def redis_message action
		msg = { 
			resource: 'chat_messages',
        	action: action,
	        id: self.id,
	        obj: self,
	    }
	    $redis.publish 'rt-change', msg.to_json
	end
end
