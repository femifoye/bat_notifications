require_relative 'Notification'
require_relative 'NotificationDb'
require_relative "Content.rb"

require "async"


module ReviewNotificationDecorator
    
    def self.set_action(action)
        @action = action
    end
    
        
    def self.set_content
        @content = Content.review_content
    end
    
    def self.set_sender
        @sender = NotificationDb.get_sender
    end
    
    def self.set_receiver
        @receiver = NotificationDb.get_receiver
    end
    
    
    def self.init_review_decorator
        set_content
        set_sender
        set_receiver
        @notification = Notification.new(@sender, @receiver, @content)
        @notification = ReviewNotification.new(@notification)
    end
    
    def self.get_review_action
        init_review_decorator
        return @notification.get_action
    end
    
    def self.get_review_content
        init_review_decorator
        content = @notification.get_content
        content_stars = content["review_stars"]
        return content_stars
    end
    
    def self.get_review_sender
        init_review_decorator
        return @notification.get_sender["lastname"]
    end
    
    def self.get_review_receiver
        init_review_decorator
        return @notification.get_receiver["lastname"]
    end
    
    def self.send_notification
        init_review_decorator
        return @notification.send_notification_to_receiver
    end
    
     def self.get_user_review_notification
        init_review_decorator
        @notification = UserReviewNotification.new(@notification)
    end
    
    def self.get_user_review_notification_subject
        init_review_decorator
        @notification = UserReviewNotification.new(@notification)
        return @notification.get_subject
    end
    
    def self.user_send_notification
        init_review_decorator
        @notification = UserReviewNotification.new(@notification)
        return @notification.send_notification_to_sender
    end

end



