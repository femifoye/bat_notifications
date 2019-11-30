require 'minitest/autorun'
require 'InboxNotificationDecorator'

class InboxNotificationTest < Minitest::Test
    def test_inbox_decorator_can_get_action
        assert_equal("Message", InboxNotificationDecorator.get_inbox_action)
    end
    
    def test_inbox_stars_has_content
        assert_equal(true, InboxNotificationDecorator.get_inbox_content)
    end
    
    def test_inbox_has_sender
        assert_equal("Sender", InboxNotificationDecorator.get_inbox_sender)
    end
    
    def test_inbox_has_receiver
        assert_equal("Receiver", InboxNotificationDecorator.get_inbox_receiver)
    end
    
    def test_inbox_can_send_email
        assert_equal(true, InboxNotificationDecorator.send_notification > 0)
    end
    
end