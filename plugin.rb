# name: Hidden Private Messages
# about: Disables updating`last_posted_at ` when a user sends a private message
# version: 0.1
# authors: Roragok


require_dependency 'post_creator'
module HiddenPrivateMessages
   def update_user_counts
      super
      unless @post.topic.private_message?
      time = @post.created_at
      end
      Rails.logger.error "USER VARIABLE -  '#{@user}'!"
      @user.update_attributes(last_posted_at: time)
   end
end

class PostCreator
   prepend HiddenPrivateMessages
end
