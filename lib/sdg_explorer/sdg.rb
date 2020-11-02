class SdgExplorer::Sdg
  @@all = []
  attr_accessor :name, :reports, :text, :url
  
  def initialize(name, text, url)
    @name = name
    @text = text
    @url = "https://sdgs.un.org" + url
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