require 'minitest/autorun'
require 'BookingNotificationDecorator'

class BookingNotificationTest < Minitest::Test
    def test_booking_decorator_can_get_action
        assert_equal("Booking", BookingNotificationDecorator.get_booking_action)
    end
    
    def test_booking_has_content
        assert_equal(true, BookingNotificationDecorator.get_booking_content)
    end
    
    def test_booking_has_sender
        assert_equal("Sender", BookingNotificationDecorator.get_booking_creator)
    end
    
    def test_booking_has_receiver
        assert_equal("Receiver", BookingNotificationDecorator.get_user_booked)
    end
    
    def test_booking_can_send_email
        assert_equal(true, BookingNotificationDecorator.send_notification > 0)
    end
    
end