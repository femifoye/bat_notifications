require 'delegate'
require 'pony'
require 'geocoder'
require 'time'


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
        @location = Geocoder.search("#{@content["location"]["latitude"]}, #{@content["location"]["longitude"]}")[0].data
        @booking_message = "<p>Location: #{@location["address"]["address29"]}</p> \r\n
        <p>Time Booked: #{Time.at(@content["date"].to_time.to_i).httpdate}</p> \r\n
        <p>Hours Booked: #{@content["hours_booked"]}</p> \r\n
        "
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
    
    def get_booking_message
        return @booking_message
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
        <p>Booking from: #{@sender["firstname"]} #{@sender["lastname"]} </p>\r\n
        #{get_booking_message} "
    end
    
     #send notification using async
    def send_notification
        @sender_email = "bookatutorapp@gmail.com"
        @receiver_email = self.get_receiver["email"]
        
        mail_status = Async do
            self.send_email
        end
        
        return mail_status.wait.content_type.length
    end
  
end


class UserBookingNotification < NotificationDecorator
    def initialize(notification)
        super(notification)
        @action = "Booking"
        @subject = "New #{@action} created"
        
    end
    
    def message
        return "<h1>You have created a #{get_action}. Check out the details below </h1>\r\n 
        <p>Tutor Booked: #{@receiver["firstname"]} #{@receiver["lastname"]}</p> \r\n
        #{get_booking_message} \r\n
        <p>Thank you for using bookatutor to create this booking</p>"
    end
    
    def get_subject
        return @subject
    end
    
    def send_notification
        @sender_email = "bookatutorapp@gmail.com"
        @receiver_email = self.get_sender["email"]
        
        mail_status = Async do
            self.send_email
        end
        
        #return mail_status.wait.content_type.length
    end
end

#end of booking decoration


class ReviewNotification < NotificationDecorator
    def initialize(notification)
        super(notification)
        @action = "Review"
    end
    
    def get_action
        return @action
    end
end

class InboxNotification < NotificationDecorator
    def initialize(notification)
        super(notification)
        @action = "Inbox"
    end
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
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
   