
###############################################################################
    
    #### DONE ####
    
    # waves => array of unique wave sizes for the next 3 days
    # hash with wave/date/time for the next 3-day
    # display waves array as CLI options
    # accept user input for wave size
    
    #### TODO ####

    # search hash for days/times when waves will be at the desired height
    # return results on CLI
    # clean up and refactor code for better organization/assignment of scraped code


# Hi there! 

# My apologies on the delay ... haven't had much time in front of the computer the last few days.

# As discussed, I incorporated a way to search for a specific wave size.  The way I collected/returned 
# data using the gem TTY-Prompt, proved challenging to work with. To save time, keep things simple, and
# move forward  ... for #Search, I built a nested hash broken down by day. Many of the data points, I pulled
# elsewhere in the program.
# 
# The #Student class below takes an input in the form of a wave size. The wave size then iterates over the 
# nested hash, #search_by_size, to locate a day/time where wave size == input.

###############################################################################

require 'pry'
require 'nokogiri'
require 'open-uri'

# 

class SurfRockaway::Search
    
    @doc = Nokogiri::HTML(open('https://magicseaweed.com/Rockaway-Surf-Report/384/'))

    def self.wave_options
        
        # scrapes magicseaweed.com for wave size each day 
        
        day_1 = @doc.search("td.background-info").text.strip.split[2..6]
        day_2 = @doc.search("td.background-info").text.strip.split[10..14]
        day_3 = @doc.search("td.background-info").text.strip.split[18..22]
        
        # combines days into a variable called "waves" 

        waves = day_1 + day_2 + day_3

        # returns "waves" as an array with only unique values
        
        waves.uniq
    
    end
    
    def self.search_by_size(selection)

        wave_sizes = [
                
            { :day => "10/15/2019", :time => "6A", :size => "1ft" },
            { :day => "10/15/2019", :time => "9A", :size => "1-2ft" },
            { :day => "10/15/2019", :time => "12P", :size => "1-2ft" },
            { :day => "10/15/2019", :time => "3P", :size => "1-2ft" },
            { :day => "10/15/2019", :time => "6P", :size => "1-2ft" },

            { :day => "10/16/2019", :time => "6A", :size => "3-4ft" },
            { :day => "10/16/2019", :time => "9A", :size => "2-4ft" },
            { :day => "10/16/2019", :time => "12P", :size => "2-4ft" },
            { :day => "10/16/2019", :time => "3P", :size => "4-5ft" },
            { :day => "10/16/2019", :time => "6P", :size => "4-5ft" },

            { :day => "10/17/2019", :time => "6A", :size => "3-5ft" },
            { :day => "10/17/2019", :time => "9A", :size => "3-5ft" },
            { :day => "10/17/2019", :time => "12P", :size => "5-6ft" },
            { :day => "10/17/2019", :time => "3P", :size => "5-6ft" },
            { :day => "10/17/2019", :time => "6P", :size => "5-6ft" },

        ]

        wave_sizes.select {|i| i[:size] == selection}
                    
    end

end