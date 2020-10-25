class SdgExplorer::Sdg
  @@all = []
  attr_accessor :name, :reports
  
  def initialize(name)
    @name = name
    @reports = []
    save
  end
  
  def self.all
    SdgExplorer::Scraper.scrape_sdgs if @@all.empty?
    @@all
  end
  
  def get_reports
    SdgExplorer::Scraper.scrape_reports(self) if @reports.empty?
  end
  
  def save
    @@all << self
  end
  
end