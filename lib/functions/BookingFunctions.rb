# this module contains all the booking functions that are shared between 
# the booking decorators

require 'geocoder'

module BookingFunctions
    def self.get_location(content)
        @location = Geocoder.search("#{content["location"]["latitude"]}, #{content["location"]["longitude"]}")[0].data
    end
    
    def self.get_booking_message(content)
        self.get_location(content)
        @booking_message = "<p>Location: #{@location["address"]["address29"]}</p> \r\n
        <p>Time Booked: #{Time.at(content["date"].to_time.to_i).httpdate}</p> \r\n
        <p>Hours Booked: #{content["hours_booked"]}</p> \r\n
       "
    end
    
end