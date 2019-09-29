class SurfRockaway::SurfReport
    attr_accessor :location, :wave_size, :wind, :primary_swell, :weather, :air_temp, :water_temp

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
        puts " Wave Size: //  #{current_report.wave_size}  //"
        puts " Wind: //  #{current_report.wind}  // "
        puts " Primary_swell: //  #{current_report.primary_swell}  //"
        puts " Weather: //  #{current_report.weather}  //"
    end

    def self.scrape_magicseaweed_3day
        doc = Nokogiri::HTML(open('https://magicseaweed.com/Rockaway-Surf-Report/384/'))

        3day_report = self.new
        date_raw = doc.search("tr.tbody-title").text.strip.split("   ")
        3day_report.date = day.compact.first

        3day_report
    end



end