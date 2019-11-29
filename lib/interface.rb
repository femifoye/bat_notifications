require_relative 'Notification'
require_relative 'NotificationDb'
require_relative "Content.rb"

require "async"

notify = Notification.new(NotificationDb.get_sender, NotificationDb.get_receiver, Content.booking_content)


notify = BookingNotification.new(notify)
notify.send_notification

notify = UserBookingNotification.new(notify)
#puts notify.get_content
notify.send_notification