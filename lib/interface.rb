require_relative 'Notification'
require_relative 'NotificationDb'
require_relative "Content.rb"

require "async"

notify = Notification.new(NotificationDb.get_sender, NotificationDb.get_receiver, Content.booking_content)
var_dump(notify)

notify = BookingNotification.new(notify)
var_dump(notify)

notify = UserBookingNotification.new(notify)
#puts notify.get_content
#notify.send_notification
var_dump(notify)