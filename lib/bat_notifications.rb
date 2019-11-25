require 'delegate'
require 'pony'

# class Notification
   
    
#     def message
#         return "This is get message from #{@action}"
#     end
    
#     def read_message
#         return "this is read message"
#     end
    
#     def get_action
#         return @action
#     end
    
    
    
# end

class BAT_Notification < SimpleDelegator
    #initialize our constructor
    def initialize(action, sender, receiver, content)
        #super(notificationBase)
        @action = action
        @sender = sender
        @receiver = receiver
        @content = content
    end
    
    def booking_method
        return "this is booking method"
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
    
    #get action i.e review, booking etc
    def get_action
        return @action
    end
    
    #send email using Pony
    def send_email
        begin
            Pony.mail(
                :to => @receiver_email, 
                :from => @sender_email,
                :subject => "You have a new #{@action}",
                :html_body => "<h1>You have received a #{@action} from #{@sender["firstname"]}. Details Below</h1><p>#{@mail_content} " ,
                :body => "You have received a #{@action} from #{@sender["firstname"]}. #{@mail_content}",
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
    
    #send notification using async
    def send_notification
        @sender_email = self.get_sender["email"]
        @receiver_email = self.get_receiver["email"]
        @mail_content = message
        
        mail_status = Async do
            self.send_email
        end
        
        return mail_status.wait.content_type.length
        
        
        
        
    end
    
    
end

class BasicNotification < BAT_Notification
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
  
end

class BookingNotification < BAT_Notification
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_content
        return @content
    end
end

class ReviewNotification < BAT_Notification
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_content
        return @content
    end
end

class InboxNotification < BAT_Notification
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_content
        return @content
    end
end

class AppMessageNotification < BAT_Notification
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_content
        return @content
    end
end
   