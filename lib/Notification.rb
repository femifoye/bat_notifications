require 'delegate'
require 'pony'
require 'geocoder'
require 'time'
require_relative 'functions/BookingFunctions'
require_relative 'functions/ReviewFunctions'


# concrete component to be decorated.
# we have a notification class that we will like to decorate based on action
# action include booking, review, inbox.
class Notification
    def initialize(sender, receiver, content)
        @sender = sender
        @receiver = receiver
        @content = content
    end
    
     #get content
    def get_content
        return @content
    end
    
    #get sender information
    def get_sender
        return @sender
    end
    
    #get receiver information
    def get_receiver
        return @receiver
    end
   
end

# decorator class that serves as super class for concrete decorators.
# includes functions that is common to all concrete decorators

class NotificationDecorator
    #initialize our constructor
    def initialize(notification)
        @notification = notification
        @action = "" 
        @sender = get_sender
        @receiver = get_receiver
        @content = get_content
    end
    
    def get_content
        return @notification.get_content
    end
    
    def get_sender
        return @notification.get_sender
    end
    
    def get_receiver
        return @notification.get_receiver
    end
    
    def get_action
        return @action
    end
    
    
    def message
        return "You have a new #{@action} from #{get_sender}. Check out the details"
    end
    
    #send email using Pony
    def send_email
        begin
            Pony.mail(
                :to => @receiver_email, 
                :from => @sender_email,
                :subject => @subject,
                :html_body => self.message,
                :body => self.message,
                :via => :smtp,
                :via_options => {
                    :address              => 'smtp.gmail.com',
                    :port                 => '587',
                    :enable_starttls_auto => true,
                    :user_name            => 'bookatutorapp@gmail.com',
                    :password             => 'b00katut0r@123!',
                    :authentication       => :plain, 
                    :domain               => "localhost.localdomain" 
                }
            )
            
            #return message-sent == true
            
        rescue Exception => e
            puts e.message
            puts e.backtrace.inspect
        end
    end
    
    def async_email
        @mail_status = Async do
            self.send_email
        end
    end
    
    def get_sender_full_name
        return "#{@sender['firstname']} #{@sender['lastname']}"   
    end
    
    def get_receiver_full_name
         return "#{@receiver['firstname']} #{@receiver['lastname']}"   
    end
    
    def send_notification_to_sender
        @sender_email = "bookatutorapp@gmail.com"
        @receiver_email = self.get_sender["email"]
        
        async_email
        
        return @mail_status.wait.content_type.length
    end
    
    def send_notification_to_receiver
        @sender_email = "bookatutorapp@gmail.com"
        @receiver_email = self.get_receiver["email"]
        
        async_email
        
        return @mail_status.wait.content_type.length
    end
    
    
end

class BasicNotification < NotificationDecorator
    
    def initialize(notification)
        super(notification)
        @action = "Basic"
    end
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
  
end

#configure notification so send to student and tutor upon booking creation
#modify @action and message within this class
class BookingNotification < NotificationDecorator
    def initialize(notification)
        super(notification)
        @action = "Booking"
        @subject = "New #{@action}"
    end
    
    def message
        return "<h1>You have a new  #{get_action}. Check out the details below</h1> \r\n
        <p>Booking from: #{get_sender_full_name}} </p>\r\n
        #{BookingFunctions.get_booking_message(get_content)} "
    end
    
     #send notification using async
    #self.send_notification_to_receiver
  
end


class UserBookingNotification < NotificationDecorator
    def initialize(notification)
        super(notification)
        @action = "Booking"
        @subject = "New #{@action} created"
        
    end
    
    def message
        return "<h1>You have created a #{get_action}. Check out the details below </h1>\r\n 
        <p>Tutor Booked: #{get_receiver_full_name}</p> \r\n
        #{BookingFunctions.get_booking_message(get_content)} \r\n
        <p>Thank you for using bookatutor to create this booking</p>"
    end
    
    def get_subject
        return @subject
    end
    
    
end

#end of booking decoration


#Cconfigure notification to send email to user and user_reviewed when action is review
class ReviewNotification < NotificationDecorator
    def initialize(notification)
        super(notification)
        @action = "Review"
        @subject = "New #{@action} "
    end
    
    def message
        return "<h1>You have a new #{get_action}. Check out the details below</h1>
        <p>Review From: #{get_sender_full_name}</p>
        #{ReviewFunctions.get_review_message(get_content)}"
    end
    
    def get_subject
        return @subject
    end
end

class UserReviewNotification < NotificationDecorator
    def initialize(notification)
        super(notification)
        @action = "Review"
        @subject = "New #{@action} created"
    end
    
    def message
        return "<h1>You created a new #{get_action}. Check out the details below</h1>
        <p>Reviewed: #{get_receiver_full_name}</p>
        #{ReviewFunctions.get_review_message(get_content)}"
    end
    
    def get_subject
        return @subject
    end
end

# end Review decorators configuration

class InboxNotification < NotificationDecorator
    def initialize(notification)
        super(notification)
        @action = "Message"
        @subject = "New #{@action}"
    end
    def message
        return "<h1>You have a new #{@action} from #{get_sender_full_name}</h1>.
        <p><a href='localhost:3000/user/signin'>Login</a> to read</p>"
    end

end

# class AppMessageNotification < NotificationDecorator
#     def message
#         return "You have a new #{@action} from #{@sender}. Check out the details"
#     end
    
#     def get_content
#         return @content
#     end
# end
   