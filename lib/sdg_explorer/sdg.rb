class SdgExplorer::Sdg
  @@all = []
  attr_accessor :name
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    SdgExplorer::Scraper.scrape_sdgs if @@all.empty?
    @@all
  end
  
  def save
    @@all << self
  end
  
end