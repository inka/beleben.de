class HomeController < ApplicationController

    def karte
        render :template => "home/#{get_kiez}/karte"
    end
    def projekt
        render :template => "home/#{get_kiez}/projekt"
    end
    def portraet
        render :template => "home/#{get_kiez}/portraet"
    end
    def quartier
        render :template => "home/#{get_kiez}/quartier"
    end
    def quartier1
        render :template => "home/#{get_kiez}/quartier1"
    end
    def quartier2
        render :template => "home/#{get_kiez}/quartier2"
    end
    def willkommen
        render :template => "home/#{get_kiez}/willkommen"
    end
    def impressum
        render :template => "home/#{get_kiez}/impressum"
    end
end

class Schillerpromenade::HomeController < HomeController
end
class Moabitwest::HomeController < HomeController
end
