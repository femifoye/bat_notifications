require_relative 'bat_notifications'
require_relative 'NotificationDb'
require_relative "Content.rb"

require "async"


module InboxNotificationDecorator
    
    def self.set_action(action)
        @action = action
    end
    
        
    def self.set_content
        @content = Content.inbox_content
    end
    
    def self.set_sender
        @sender = NotificationDb.get_sender
    end
    
    def self.set_receiver
        @receiver = NotificationDb.get_receiver
    end
    
    
    def self.init_inbox_decorator
        set_action("Inbox")
        set_content
        set_sender
        set_receiver
        @inboxNotification = InboxNotification.new( @action, @sender, @receiver, @content )
    end
    
    def self.get_inbox_action
        init_inbox_decorator
        return @inboxNotification.get_action
    end
    
    def self.get_inbox_content
        init_inbox_decorator
        content = @inboxNotification.get_content
        inbox_content = content["message_content"]
        return true if inbox_content
    end
    
    def self.get_inbox_sender
        init_inbox_decorator
        return @inboxNotification.get_sender["lastname"]
    end
    
    def self.get_inbox_receiver
        init_inbox_decorator
        return @inboxNotification.get_receiver["lastname"]
    end
    
    def self.send_notification
        init_inbox_decorator
        return @inboxNotification.send_notification
    end

end



