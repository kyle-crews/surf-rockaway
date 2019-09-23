class SurfToday::Condition
    attr_accessor :location, :temp, :H2Otemp, :wave_size, :rain, :one, :two

    def self.today
 
    conditions = self.new
    conditions.location = "Rockaway Beach, Queens, NY"
    conditions.temp = "87"
    conditions.H2Otemp = "62"
    conditions.wave_size = "3-4ft"
    conditions.rain = "No"

    [conditions]
    end

    def self.menu_options
        option = self.new
        option.one = "Set notification"
        option.two = "Next 3 days"

    [option]
    end

end

=begin

puts <<-DOC.gsub /^\s*/,''
            
===========================
Rockaway Beach, Queens, NY
temp: 87 // H2O temp: 62
wave: 3-4ft // Rain? No
===========================
DOC

=end