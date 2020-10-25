class SdgExplorer::Scraper
  
  def self.scrape_sdgs
    doc = Nokogiri::HTML(open("https://sdgs.un.org/goals"))
    sdgs = doc.css(".card")
    sdgs.each do |s|
      name = s.css(".goal-title").text
      SdgExplorer::Sdg.new(name) if name!=""
    end
  end
  
end