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
        set_action("Review")
        set_content
        set_sender
        set_receiver
        @reviewNotification = ReviewNotification.new( @action, @sender, @receiver, @content )
    end
    
    def self.get_review_action
        init_review_decorator
        return @reviewNotification.get_action
    end
    
    def self.get_review_content
        init_review_decorator
        content = @reviewNotification.get_content
        content_stars = content["review_stars"]
        return content_stars
    end
    
    def self.get_review_sender
        init_review_decorator
        return @reviewNotification.get_sender["lastname"]
    end
    
    def self.get_review_receiver
        init_review_decorator
        return @reviewNotification.get_receiver["lastname"]
    end
    
    def self.send_notification
        init_review_decorator
        return @reviewNotification.send_notification
    end
    
    # init_review_decorator
    # send_email = Async do
    #     @reviewNotification.send_notification
    # end

    # puts send_email.status
    

    
end



