{"filter":false,"title":"bat_notifications.rb","tooltip":"/lib/bat_notifications.rb","undoManager":{"mark":6,"position":6,"stack":[[{"start":{"row":8,"column":0},"end":{"row":20,"column":73},"action":"remove","lines":["<<<<<<< HEAD:lib/Notification.rb","# concrete component to be decorated.","# we have a notification class that we will like to decorate based on action","# action include booking, review, inbox.","class Notification","    def initialize(sender, receiver, content)","=======","class BAT_Notification < SimpleDelegator","    #initialize our constructor","    def initialize(action, sender, receiver, content)","        #super(notificationBase)","        @action = action",">>>>>>> 287099534955a85ed26ba48ee6082bdc02b32cd2:lib/bat_notifications.rb"],"id":2},{"start":{"row":8,"column":0},"end":{"row":12,"column":45},"action":"insert","lines":["# concrete component to be decorated.","# we have a notification class that we will like to decorate based on action","# action include booking, review, inbox.","class Notification","    def initialize(sender, receiver, content)"]}],[{"start":{"row":133,"column":0},"end":{"row":142,"column":73},"action":"remove","lines":["<<<<<<< HEAD:lib/Notification.rb","class BasicNotification < NotificationDecorator","    ","    def initialize(notification)","        super(notification)","        @action = \"Basic\"","    end","=======","class BasicNotification < BAT_Notification",">>>>>>> 287099534955a85ed26ba48ee6082bdc02b32cd2:lib/bat_notifications.rb"],"id":3},{"start":{"row":133,"column":0},"end":{"row":138,"column":7},"action":"insert","lines":["class BasicNotification < NotificationDecorator","    ","    def initialize(notification)","        super(notification)","        @action = \"Basic\"","    end"]}],[{"start":{"row":146,"column":0},"end":{"row":158,"column":73},"action":"remove","lines":["<<<<<<< HEAD:lib/Notification.rb","#configure notification so send to student and tutor upon booking creation","#modify @action and message within this class","class BookingNotification < NotificationDecorator","    def initialize(notification)","        super(notification)","        @action = \"Booking\"","        @subject = \"New #{@action}\"","=======","class BookingNotification < BAT_Notification","    def message","        return \"You have a new #{@action} from #{@sender}. Check out the details\"",">>>>>>> 287099534955a85ed26ba48ee6082bdc02b32cd2:lib/bat_notifications.rb"],"id":4},{"start":{"row":146,"column":0},"end":{"row":152,"column":35},"action":"insert","lines":["#configure notification so send to student and tutor upon booking creation","#modify @action and message within this class","class BookingNotification < NotificationDecorator","    def initialize(notification)","        super(notification)","        @action = \"Booking\"","        @subject = \"New #{@action}\""]}],[{"start":{"row":166,"column":0},"end":{"row":178,"column":73},"action":"remove","lines":["<<<<<<< HEAD:lib/Notification.rb","","class UserBookingNotification < NotificationDecorator","    def initialize(notification)","        super(notification)","        @action = \"Booking\"","        @subject = \"New #{@action} created\"","        ","    end","    ","=======","class ReviewNotification < BAT_Notification",">>>>>>> 287099534955a85ed26ba48ee6082bdc02b32cd2:lib/bat_notifications.rb"],"id":5},{"start":{"row":166,"column":0},"end":{"row":174,"column":4},"action":"insert","lines":["","class UserBookingNotification < NotificationDecorator","    def initialize(notification)","        super(notification)","        @action = \"Booking\"","        @subject = \"New #{@action} created\"","        ","    end","    "]}],[{"start":{"row":189,"column":0},"end":{"row":203,"column":73},"action":"remove","lines":["<<<<<<< HEAD:lib/Notification.rb","#end of booking decoration","","","#Cconfigure notification to send email to user and user_reviewed when action is review","class ReviewNotification < NotificationDecorator","    def initialize(notification)","        super(notification)","        @action = \"Review\"","        @subject = \"New #{@action} \"","    end","    ","=======","class InboxNotification < BAT_Notification",">>>>>>> 287099534955a85ed26ba48ee6082bdc02b32cd2:lib/bat_notifications.rb"],"id":6},{"start":{"row":189,"column":0},"end":{"row":199,"column":4},"action":"insert","lines":["#end of booking decoration","","","#Cconfigure notification to send email to user and user_reviewed when action is review","class ReviewNotification < NotificationDecorator","    def initialize(notification)","        super(notification)","        @action = \"Review\"","        @subject = \"New #{@action} \"","    end","    "]}],[{"start":{"row":211,"column":0},"end":{"row":221,"column":73},"action":"remove","lines":["<<<<<<< HEAD:lib/Notification.rb","class UserReviewNotification < NotificationDecorator","    def initialize(notification)","        super(notification)","        @action = \"Review\"","        @subject = \"New #{@action} created\"","    end","    ","=======","class AppMessageNotification < BAT_Notification",">>>>>>> 287099534955a85ed26ba48ee6082bdc02b32cd2:lib/bat_notifications.rb"],"id":7},{"start":{"row":211,"column":0},"end":{"row":217,"column":4},"action":"insert","lines":["class UserReviewNotification < NotificationDecorator","    def initialize(notification)","        super(notification)","        @action = \"Review\"","        @subject = \"New #{@action} created\"","    end","    "]}],[{"start":{"row":11,"column":6},"end":{"row":11,"column":7},"action":"insert","lines":["B"],"id":8},{"start":{"row":11,"column":7},"end":{"row":11,"column":8},"action":"insert","lines":["A"]},{"start":{"row":11,"column":8},"end":{"row":11,"column":9},"action":"insert","lines":["T"]},{"start":{"row":11,"column":9},"end":{"row":11,"column":10},"action":"insert","lines":["_"]}]]},"ace":{"folds":[],"scrolltop":909,"scrollleft":0,"selection":{"start":{"row":11,"column":10},"end":{"row":11,"column":10},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1575148871646,"hash":"fcaffec9f83011ecbc556802bba3843ec3e5dbbf"}