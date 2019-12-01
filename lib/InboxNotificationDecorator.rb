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
        set_content
        set_sender
        set_receiver
        @notification = BAT_Notification.new(@sender, @receiver, @content)
        @notification = InboxNotification.new(@notification)
    end
    
    def self.get_inbox_action
        init_inbox_decorator
        return @notification.get_action
    end
    
    def self.get_inbox_content
        init_inbox_decorator
        content = @notification.get_content
        inbox_content = content["message_content"]
        return true if inbox_content
    end
    
    def self.get_inbox_sender
        init_inbox_decorator
        return @notification.get_sender["lastname"]
    end
    
    def self.get_inbox_receiver
        init_inbox_decorator
        return @notification.get_receiver["lastname"]
    end
    
    def self.send_notification
        init_inbox_decorator
        return @notification.send_notification_to_receiver
    end

end



