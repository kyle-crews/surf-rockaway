
###############################################################################
    
    #### DONE ####
    
    # waves => array of unique wave sizes for the next 3 days
    # hash with wave/date/time for the next 3-day
    # display waves array as CLI options
    # accept user input for wave size
    # search hash for days/times when waves will be at the desired height
    # return results on CLI
    # fix return formatting for #return_values
    # link values for #search_wave_size
    
    #### TODO ####

    # refactor code for clarity

# As discussed, I buit out functionality to search for a specific wave size.
# 
#   1. select input from a index of avaliable wave sizes
#   2. use input to query dates, times, and wave sizes from 3 day forecast 
#   3. return date && time when wave size == input
# 
# The way I collected/returned data, using the TTY-Prompt gem, proved challenging to work with. To save time
# and move forward  ... I built a nested hash, broken down by day, in #Search.
# The #Search class below takes an input in the form of a wave size. The wave size then iterates over the 
# nested hash, #search_by_size, to locate a day/time where wave size == input.

###############################################################################

class SurfRockaway::Search
    
    @doc = Nokogiri::HTML(open('https://magicseaweed.com/Rockaway-Surf-Report/384/'))

    def self.wave_options
        
        # scrapes magicseaweed.com for wave size each day 
        
        day_1 = @doc.search("td.background-info").text.strip.split[2..6]
        day_2 = @doc.search("td.background-info").text.strip.split[10..14]
        day_3 = @doc.search("td.background-info").text.strip.split[18..22]
        
        # combines days into a variable called "waves" 
        # returns "waves" as an array with only unique values

        @size = day_1 + day_2 + day_3
        @size.uniq

    end

    def self.date_options

        # scrapes magicseaweed.com for dates
        @date = []

        day_1 = @doc.search("tr.tbody-title").text.strip.split("   ").compact.first 
        day_2 = @doc.search("tr.tbody-title").text.strip.split.slice(4..5).join(" ")
        day_3 = @doc.search("tr.tbody-title").text.strip.split.slice(6..7).join(" ")

        # returns data for each day && pushes data to instance variable @date 
        @date << day_1
        @date << day_2
        @date << day_3

        # calls @date
        @date

    end

    def self.time_options

        # scrapes magicseaweed.com for times && returns @times variable

        @time = @doc.search("td.nopadding-left").text.strip.split[2..6]
        @time

    end

    def self.collect_data

        # call #wave_options, @waves, #date_options, #time_options
        
        wave_options && @waves
        date_options
        time_options
    
    end

    
    def self.search_by_size(selection)
        
        # calls #collect_data
        collect_data

        # create array to store day, time, and wave size as nested hash
        wave_sizes = [
                
            { :day => "#{@date[0]}", :time => "#{@time[0]}", :size => "#{@size[0]}" },
            { :day => "#{@date[0]}", :time => "#{@time[1]}", :size => "#{@size[1]}" },
            { :day => "#{@date[0]}", :time => "#{@time[2]}", :size => "#{@size[2]}" },
            { :day => "#{@date[0]}", :time => "#{@time[3]}", :size => "#{@size[3]}" },
            { :day => "#{@date[0]}", :time => "#{@time[4]}", :size => "#{@size[4]}" },

            { :day => "#{@date[1]}", :time => "#{@time[0]}", :size => "#{@size[5]}" },
            { :day => "#{@date[1]}", :time => "#{@time[1]}", :size => "#{@size[6]}" },
            { :day => "#{@date[1]}", :time => "#{@time[2]}", :size => "#{@size[7]}" },
            { :day => "#{@date[1]}", :time => "#{@time[3]}", :size => "#{@size[8]}" },
            { :day => "#{@date[1]}", :time => "#{@time[4]}", :size => "#{@size[9]}" },

            { :day => "#{@date[2]}", :time => "#{@time[0]}", :size => "#{@size[10]}" },
            { :day => "#{@date[2]}", :time => "#{@time[1]}", :size => "#{@size[11]}" },
            { :day => "#{@date[2]}", :time => "#{@time[2]}", :size => "#{@size[12]}" },
            { :day => "#{@date[2]}", :time => "#{@time[3]}", :size => "#{@size[13]}" },
            { :day => "#{@date[2]}", :time => "#{@time[4]}", :size => "#{@size[14]}" },

        ]

        # selection argument captured on ./cli.rb
        # selection compared to key :size by iterating over array #wave_sizes
        wave_sizes.select {|i| i[:size] == selection}
               
    end

end