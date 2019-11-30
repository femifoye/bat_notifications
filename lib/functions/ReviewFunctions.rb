# this module contains all the review functions that are shared between 
# the review decorators

module ReviewFunctions
    def self.get_review_message(content)
        @review_message = "<p>Review Content: #{content['content']}</p>
        <p>Review Stars: #{content['review_stars']}"
    end
end

