{"changed":true,"filter":false,"title":"InboxNotificationDecorator.rb","tooltip":"/lib/InboxNotificationDecorator.rb","value":"","undoManager":{"mark":18,"position":21,"stack":[[{"start":{"row":0,"column":0},"end":{"row":66,"column":0},"action":"insert","lines":["require_relative 'Notification'","require_relative 'NotificationDb'","require_relative \"Content.rb\"","","require \"async\"","","","module BookingNotificationDecorator","    ","    def self.set_action(action)","        @action = action","    end","    ","        ","    def self.set_content","        @content = Content.booking_content","    end","    ","    def self.set_sender","        @sender = NotificationDb.get_sender","    end","    ","    def self.set_receiver","        @receiver = NotificationDb.get_receiver","    end","    ","    ","    def self.init_booking_decorator","        set_action(\"Booking\")","        set_content","        set_sender","        set_receiver","        @bookingNotification = BookingNotification.new( @action, @sender, @receiver, @content )","    end","    ","    def self.get_booking_action","        init_booking_decorator","        return @bookingNotification.get_action","    end","    ","    def self.get_booking_content","        init_booking_decorator","        content = @bookingNotification.get_content","        booking_location = content[\"location\"]","        return true if booking_location","    end","    ","    def self.get_booking_creator","        init_booking_decorator","        return @bookingNotification.get_sender[\"lastname\"]","    end","    ","    def self.get_user_booked","        init_booking_decorator","        return @bookingNotification.get_receiver[\"lastname\"]","    end","    ","    def self.send_notification","        init_booking_decorator","        return @bookingNotification.send_notification","    end","","end","","","",""],"id":1}],[{"start":{"row":7,"column":7},"end":{"row":7,"column":26},"action":"remove","lines":["BookingNotification"],"id":2},{"start":{"row":7,"column":7},"end":{"row":7,"column":24},"action":"insert","lines":["InboxNotification"]}],[{"start":{"row":32,"column":8},"end":{"row":32,"column":16},"action":"remove","lines":["@booking"],"id":3},{"start":{"row":32,"column":8},"end":{"row":32,"column":14},"action":"insert","lines":["@inbox"]},{"start":{"row":37,"column":15},"end":{"row":37,"column":23},"action":"remove","lines":["@booking"]},{"start":{"row":37,"column":15},"end":{"row":37,"column":21},"action":"insert","lines":["@inbox"]},{"start":{"row":42,"column":18},"end":{"row":42,"column":26},"action":"remove","lines":["@booking"]},{"start":{"row":42,"column":18},"end":{"row":42,"column":24},"action":"insert","lines":["@inbox"]},{"start":{"row":49,"column":15},"end":{"row":49,"column":23},"action":"remove","lines":["@booking"]},{"start":{"row":49,"column":15},"end":{"row":49,"column":21},"action":"insert","lines":["@inbox"]},{"start":{"row":54,"column":15},"end":{"row":54,"column":23},"action":"remove","lines":["@booking"]},{"start":{"row":54,"column":15},"end":{"row":54,"column":21},"action":"insert","lines":["@inbox"]},{"start":{"row":59,"column":15},"end":{"row":59,"column":23},"action":"remove","lines":["@booking"]},{"start":{"row":59,"column":15},"end":{"row":59,"column":21},"action":"insert","lines":["@inbox"]}],[{"start":{"row":32,"column":29},"end":{"row":32,"column":36},"action":"remove","lines":["Booking"],"id":4},{"start":{"row":32,"column":29},"end":{"row":32,"column":34},"action":"insert","lines":["inbox"]}],[{"start":{"row":15,"column":27},"end":{"row":15,"column":34},"action":"remove","lines":["booking"],"id":5},{"start":{"row":15,"column":27},"end":{"row":15,"column":32},"action":"insert","lines":["inbox"]},{"start":{"row":27,"column":18},"end":{"row":27,"column":25},"action":"remove","lines":["booking"]},{"start":{"row":27,"column":18},"end":{"row":27,"column":23},"action":"insert","lines":["inbox"]},{"start":{"row":28,"column":20},"end":{"row":28,"column":27},"action":"remove","lines":["Booking"]},{"start":{"row":28,"column":20},"end":{"row":28,"column":25},"action":"insert","lines":["inbox"]},{"start":{"row":35,"column":17},"end":{"row":35,"column":24},"action":"remove","lines":["booking"]},{"start":{"row":35,"column":17},"end":{"row":35,"column":22},"action":"insert","lines":["inbox"]},{"start":{"row":36,"column":13},"end":{"row":36,"column":20},"action":"remove","lines":["booking"]},{"start":{"row":36,"column":13},"end":{"row":36,"column":18},"action":"insert","lines":["inbox"]},{"start":{"row":40,"column":17},"end":{"row":40,"column":24},"action":"remove","lines":["booking"]},{"start":{"row":40,"column":17},"end":{"row":40,"column":22},"action":"insert","lines":["inbox"]},{"start":{"row":41,"column":13},"end":{"row":41,"column":20},"action":"remove","lines":["booking"]},{"start":{"row":41,"column":13},"end":{"row":41,"column":18},"action":"insert","lines":["inbox"]},{"start":{"row":43,"column":8},"end":{"row":43,"column":15},"action":"remove","lines":["booking"]},{"start":{"row":43,"column":8},"end":{"row":43,"column":13},"action":"insert","lines":["inbox"]},{"start":{"row":44,"column":23},"end":{"row":44,"column":30},"action":"remove","lines":["booking"]},{"start":{"row":44,"column":23},"end":{"row":44,"column":28},"action":"insert","lines":["inbox"]},{"start":{"row":47,"column":17},"end":{"row":47,"column":24},"action":"remove","lines":["booking"]},{"start":{"row":47,"column":17},"end":{"row":47,"column":22},"action":"insert","lines":["inbox"]},{"start":{"row":48,"column":13},"end":{"row":48,"column":20},"action":"remove","lines":["booking"]},{"start":{"row":48,"column":13},"end":{"row":48,"column":18},"action":"insert","lines":["inbox"]},{"start":{"row":53,"column":13},"end":{"row":53,"column":20},"action":"remove","lines":["booking"]},{"start":{"row":53,"column":13},"end":{"row":53,"column":18},"action":"insert","lines":["inbox"]},{"start":{"row":58,"column":13},"end":{"row":58,"column":20},"action":"remove","lines":["booking"]},{"start":{"row":58,"column":13},"end":{"row":58,"column":18},"action":"insert","lines":["inbox"]}],[{"start":{"row":28,"column":20},"end":{"row":28,"column":21},"action":"remove","lines":["i"],"id":6}],[{"start":{"row":28,"column":20},"end":{"row":28,"column":21},"action":"insert","lines":["I"],"id":7}],[{"start":{"row":43,"column":34},"end":{"row":43,"column":42},"action":"remove","lines":["location"],"id":8},{"start":{"row":43,"column":34},"end":{"row":43,"column":35},"action":"insert","lines":["m"]},{"start":{"row":43,"column":35},"end":{"row":43,"column":36},"action":"insert","lines":["e"]},{"start":{"row":43,"column":36},"end":{"row":43,"column":37},"action":"insert","lines":["s"]},{"start":{"row":43,"column":37},"end":{"row":43,"column":38},"action":"insert","lines":["s"]},{"start":{"row":43,"column":38},"end":{"row":43,"column":39},"action":"insert","lines":["a"]},{"start":{"row":43,"column":39},"end":{"row":43,"column":40},"action":"insert","lines":["g"]},{"start":{"row":43,"column":40},"end":{"row":43,"column":41},"action":"insert","lines":["e"]},{"start":{"row":43,"column":41},"end":{"row":43,"column":42},"action":"insert","lines":["_"]},{"start":{"row":43,"column":42},"end":{"row":43,"column":43},"action":"insert","lines":["c"]}],[{"start":{"row":43,"column":43},"end":{"row":43,"column":44},"action":"insert","lines":["o"],"id":9},{"start":{"row":43,"column":44},"end":{"row":43,"column":45},"action":"insert","lines":["n"]},{"start":{"row":43,"column":45},"end":{"row":43,"column":46},"action":"insert","lines":["t"]},{"start":{"row":43,"column":46},"end":{"row":43,"column":47},"action":"insert","lines":["e"]},{"start":{"row":43,"column":47},"end":{"row":43,"column":48},"action":"insert","lines":["n"]},{"start":{"row":43,"column":48},"end":{"row":43,"column":49},"action":"insert","lines":["t"]}],[{"start":{"row":43,"column":14},"end":{"row":43,"column":22},"action":"remove","lines":["location"],"id":10},{"start":{"row":43,"column":14},"end":{"row":43,"column":15},"action":"insert","lines":["c"]},{"start":{"row":43,"column":15},"end":{"row":43,"column":16},"action":"insert","lines":["o"]},{"start":{"row":43,"column":16},"end":{"row":43,"column":17},"action":"insert","lines":["n"]},{"start":{"row":43,"column":17},"end":{"row":43,"column":18},"action":"insert","lines":["t"]},{"start":{"row":43,"column":18},"end":{"row":43,"column":19},"action":"insert","lines":["e"]},{"start":{"row":43,"column":19},"end":{"row":43,"column":20},"action":"insert","lines":["n"]},{"start":{"row":43,"column":20},"end":{"row":43,"column":21},"action":"insert","lines":["t"]}],[{"start":{"row":44,"column":29},"end":{"row":44,"column":37},"action":"remove","lines":["location"],"id":11},{"start":{"row":44,"column":29},"end":{"row":44,"column":30},"action":"insert","lines":["c"]},{"start":{"row":44,"column":30},"end":{"row":44,"column":31},"action":"insert","lines":["o"]},{"start":{"row":44,"column":31},"end":{"row":44,"column":32},"action":"insert","lines":["n"]},{"start":{"row":44,"column":32},"end":{"row":44,"column":33},"action":"insert","lines":["t"]},{"start":{"row":44,"column":33},"end":{"row":44,"column":34},"action":"insert","lines":["e"]},{"start":{"row":44,"column":34},"end":{"row":44,"column":35},"action":"insert","lines":["r"]},{"start":{"row":44,"column":35},"end":{"row":44,"column":36},"action":"insert","lines":["n"]},{"start":{"row":44,"column":36},"end":{"row":44,"column":37},"action":"insert","lines":["t"]}],[{"start":{"row":44,"column":36},"end":{"row":44,"column":37},"action":"remove","lines":["t"],"id":12},{"start":{"row":44,"column":35},"end":{"row":44,"column":36},"action":"remove","lines":["n"]},{"start":{"row":44,"column":34},"end":{"row":44,"column":35},"action":"remove","lines":["r"]}],[{"start":{"row":44,"column":34},"end":{"row":44,"column":35},"action":"insert","lines":["t"],"id":13}],[{"start":{"row":44,"column":34},"end":{"row":44,"column":35},"action":"remove","lines":["t"],"id":14}],[{"start":{"row":44,"column":34},"end":{"row":44,"column":35},"action":"insert","lines":["j"],"id":15},{"start":{"row":44,"column":35},"end":{"row":44,"column":36},"action":"insert","lines":["t"]}],[{"start":{"row":44,"column":35},"end":{"row":44,"column":36},"action":"remove","lines":["t"],"id":16},{"start":{"row":44,"column":34},"end":{"row":44,"column":35},"action":"remove","lines":["j"]}],[{"start":{"row":44,"column":34},"end":{"row":44,"column":35},"action":"insert","lines":["n"],"id":17},{"start":{"row":44,"column":35},"end":{"row":44,"column":36},"action":"insert","lines":["t"]}],[{"start":{"row":32,"column":29},"end":{"row":32,"column":30},"action":"remove","lines":["i"],"id":18}],[{"start":{"row":32,"column":29},"end":{"row":32,"column":30},"action":"insert","lines":["I"],"id":19}],[{"start":{"row":47,"column":23},"end":{"row":47,"column":30},"action":"remove","lines":["creator"],"id":20},{"start":{"row":47,"column":23},"end":{"row":47,"column":24},"action":"insert","lines":["s"]},{"start":{"row":47,"column":24},"end":{"row":47,"column":25},"action":"insert","lines":["e"]},{"start":{"row":47,"column":25},"end":{"row":47,"column":26},"action":"insert","lines":["n"]},{"start":{"row":47,"column":26},"end":{"row":47,"column":27},"action":"insert","lines":["d"]},{"start":{"row":47,"column":27},"end":{"row":47,"column":28},"action":"insert","lines":["e"]},{"start":{"row":47,"column":28},"end":{"row":47,"column":29},"action":"insert","lines":["r"]}],[{"start":{"row":52,"column":17},"end":{"row":52,"column":28},"action":"remove","lines":["user_booked"],"id":21},{"start":{"row":52,"column":17},"end":{"row":52,"column":18},"action":"insert","lines":["i"]},{"start":{"row":52,"column":18},"end":{"row":52,"column":19},"action":"insert","lines":["n"]},{"start":{"row":52,"column":19},"end":{"row":52,"column":20},"action":"insert","lines":["b"]},{"start":{"row":52,"column":20},"end":{"row":52,"column":21},"action":"insert","lines":["o"]},{"start":{"row":52,"column":21},"end":{"row":52,"column":22},"action":"insert","lines":["x"]}],[{"start":{"row":52,"column":22},"end":{"row":52,"column":23},"action":"insert","lines":["_"],"id":22},{"start":{"row":52,"column":23},"end":{"row":52,"column":24},"action":"insert","lines":["r"]},{"start":{"row":52,"column":24},"end":{"row":52,"column":25},"action":"insert","lines":["e"]}]]},"ace":{"folds":[],"scrolltop":600,"scrollleft":0,"selection":{"start":{"row":52,"column":25},"end":{"row":52,"column":25},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":41,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1574545854252}