class SurfRockaway::SurfReport
    attr_accessor :location, :wave_size, :wind, :primary_swell, :weather, :temp, :date, :time

    def self.current
        # Scrape magicseaweed.com and return current conditions for rockaway
        self.scrape_data
    end

    def self.scrape_data
        # creates empty array to store data
        conditions = []

        # pushes new instances of data from magicseaweed.com to conditions array
        conditions << self.scrape_magicseaweed

        conditions
    end

    def self.multi_day
        # Scrape 3-day forecast
        self.scrape_data_multi
    end

    def self.scrape_data_multi
        
        multi_day = []
        
        multi_day << self.scrape_magicseaweed_3day

        multi_day
    end


    def self.scrape_magicseaweed
        doc = Nokogiri::HTML(open('https://magicseaweed.com/Rockaway-Surf-Report/384/'))
        
        current_report = self.new
        location_raw = doc.search("div.forecast-sub-title-fluid").text.strip.split
        current_report.location = location_raw.first(5).join(" ")
        current_report.wave_size = doc.xpath("//ul[@class='rating rating-large clearfix']/li").text.strip
        current_report.wind = doc.xpath("//p[@class='h5 nomargin-top']").text.strip
        p_swell = doc.search("div.list-group-content").text.strip.split
        current_report.primary_swell = p_swell.first(3).join(" ")
        current_report.weather = doc.xpath("//p[@class='nomargin-bottom']/i").text.strip
        
        puts "================================"
        puts "#{current_report.location}"
        puts "================================"
        puts ""
        puts " Wave Size: //  #{current_report.wave_size}  //".blue
        puts " Wind: //  #{current_report.wind}  // ".blue
        puts " Primary_swell: //  #{current_report.primary_swell}  //".blue
        puts " Weather: //  #{current_report.weather}  //".blue
        puts ""
        puts ""
        puts "######################################"
    end

    def self.scrape_magicseaweed_3day
        doc = Nokogiri::HTML(open('https://magicseaweed.com/Rockaway-Surf-Report/384/'))

        # collect Day 1

        day_1 = self.new
        day_1.date = doc.search("tr.tbody-title").text.strip.split("   ").compact.first
        day_1.time = doc.search("td.nopadding-left").text.strip.split[2..6]
        day_1.wave_size = doc.search("td.background-info").text.strip.split[2..6]
        day_1.primary_swell = doc.search("h4.font-sans-serif").text.strip.split[4..13]
        day_1.temp = doc.search("h5.heavy").text.strip.split("f")[2..6]

        # collect Day 2

        day_2 = self.new
        day_2.date = doc.search("tr.tbody-title").text.strip.split.slice(4..5).join(" ")
        day_2.time = doc.search("td.nopadding-left").text.strip.split[2..6]
        day_2.wave_size = doc.search("td.background-info").text.strip.split[10..14]
        day_2.primary_swell = doc.search("h4.font-sans-serif").text.strip.split[20..29]
        day_2.temp = doc.search("h5.heavy").text.strip.split("f")[10..14]

        # collect Day 3

        day_3 = self.new
        day_3.date = doc.search("tr.tbody-title").text.strip.split.slice(6..7).join(" ")
        day_3.time = doc.search("td.nopadding-left").text.strip.split[2..6]
        day_3.wave_size = doc.search("td.background-info").text.strip.split[18..22]
        day_3.primary_swell = doc.search("h4.font-sans-serif").text.strip.split[36..45]
        day_3.temp = doc.search("h5.heavy").text.strip.split("f")[18..22]

        # CLI display for 3 day forecast

        puts ""
        puts "==========================="
        puts "#{day_1.date}"
        puts "==========================="
        table = TTY::Table.new ['', 'wave_size', 'primary_swell', 'temp'], 
        [       
            ["#{day_1.time[0]}", "#{day_1.wave_size[0]}", "#{day_1.primary_swell[0]}", "#{day_1.temp[0]}"],
            ["#{day_1.time[1]}", "#{day_1.wave_size[1]}", "#{day_1.primary_swell[1]}", "#{day_1.temp[1]}"],
            ["#{day_1.time[2]}", "#{day_1.wave_size[2]}", "#{day_1.primary_swell[2]}", "#{day_1.temp[2]}"],
            ["#{day_1.time[3]}", "#{day_1.wave_size[3]}", "#{day_1.primary_swell[3]}", "#{day_1.temp[3]}"],
            ["#{day_1.time[4]}", "#{day_1.wave_size[4]}", "#{day_1.primary_swell[4]}", "#{day_1.temp[4]}"]
        ]
        puts table.render(:ascii).green
        puts ""
        puts "==========================="
        puts "#{day_2.date}"
        puts "==========================="
        table = TTY::Table.new ['', 'wave_size', 'primary_swell', 'temp'],
        [       
            ["#{day_2.time[0]}", "#{day_2.wave_size[0]}", "#{day_2.primary_swell[0]}", "#{day_2.temp[0]}"],
            ["#{day_2.time[1]}", "#{day_2.wave_size[1]}", "#{day_2.primary_swell[1]}", "#{day_2.temp[1]}"],
            ["#{day_2.time[2]}", "#{day_2.wave_size[2]}", "#{day_2.primary_swell[2]}", "#{day_2.temp[2]}"],
            ["#{day_2.time[3]}", "#{day_2.wave_size[3]}", "#{day_2.primary_swell[3]}", "#{day_2.temp[3]}"],
            ["#{day_2.time[4]}", "#{day_2.wave_size[4]}", "#{day_2.primary_swell[4]}", "#{day_2.temp[4]}"]
        ]
        puts table.render(:ascii).green

        puts ""
        puts "==========================="
        puts "#{day_3.date}"
        puts "==========================="
        table = TTY::Table.new ['', 'wave_size', 'primary_swell', 'temp'],
        [       
            ["#{day_3.time[0]}", "#{day_3.wave_size[0]}", "#{day_3.primary_swell[0]}", "#{day_3.temp[0]}"],
            ["#{day_3.time[1]}", "#{day_3.wave_size[1]}", "#{day_3.primary_swell[1]}", "#{day_3.temp[1]}"],
            ["#{day_3.time[2]}", "#{day_3.wave_size[2]}", "#{day_3.primary_swell[2]}", "#{day_3.temp[2]}"],
            ["#{day_3.time[3]}", "#{day_3.wave_size[3]}", "#{day_3.primary_swell[3]}", "#{day_3.temp[3]}"],
            ["#{day_3.time[4]}", "#{day_3.wave_size[4]}", "#{day_3.primary_swell[4]}", "#{day_3.temp[4]}"]
        ]
        puts table.render(:ascii).green
        puts ""
        puts ""
        puts "######################################"
        
    end

end