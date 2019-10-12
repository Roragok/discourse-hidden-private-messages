# name: Hidden Private Messages
# about: Disables updating`last_posted_at ` when a user sends a private message
# version: 0.1
# authors: Roragok
# url: https://github.com/Roragok/discourse-hidden-private-messages

class ::PostCreator
  module HiddenPrivateMessagesPostCreator
    def update_user_counts

       time = @user.last_posted_at

       unless @post.topic.private_message?
         time = @post.created_at
       end

       super
       @user.update(last_posted_at: time)
    end
  end
  prepend HiddenPrivateMessagesPostCreator
end
