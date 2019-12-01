# this module contains all the booking functions that are shared between 
# the booking decorators

require 'certified'
require 'geocoder'

# Geocoder.configure(  
#  # geocoding options
#  :timeout      => 7,           # geocoding service timeout (secs)
#  :lookup       => :google,     # name of geocoding service (symbol)
#  :language     => :en,         # ISO-639 language code
#  :use_https    => true,        # use HTTPS for lookup requests? (if supported)
#  :http_proxy   => '',          # HTTP proxy server (user:pass@host:port)
#  :https_proxy  => '',          # HTTPS proxy server (user:pass@host:port)
#  :api_key      => "",         # API key for geocoding service
#  :cache        => nil,         # cache object (must respond to #[], #[]=, and #keys)
#  :cache_prefix => "geocoder:", # prefix (string) to use for all cache keys
# )

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