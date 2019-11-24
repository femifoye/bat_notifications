require 'minitest/autorun'
require 'ReviewNotificationDecorator'

class ReviewNotificationTest < Minitest::Test
    def test_review_decorator_can_get_action
        assert_equal("Review", ReviewNotificationDecorator.get_review_action)
    end
    
    def test_review_stars_has_content
        assert_equal("4", ReviewNotificationDecorator.get_review_content)
    end
    
    def test_review_has_sender
        assert_equal("Sender", ReviewNotificationDecorator.get_review_sender)
    end
    
    def test_review_has_receiver
        assert_equal("Receiver", ReviewNotificationDecorator.get_review_receiver)
    end
    
    def test_review_can_send_email
        assert_equal(true, ReviewNotificationDecorator.send_notification > 0)
    end
    
end