class SdgExplorer::Scraper
  
  def self.scrape_sdgs
    doc = Nokogiri::HTML(open("https://sdgs.un.org/goals"))
    sdgs = doc.css(".card")
    sdgs.each do |s|
      name = s.css(".goal-title").text
      SdgExplorer::Sdg.new(name) if name!=""
    end
  end
  
  def self.scrape_reports(sdg)
    SdgExplorer::Report.new("2020", "test report 1")
    SdgExplorer::Report.new("2019", "test report 2")
  end
end