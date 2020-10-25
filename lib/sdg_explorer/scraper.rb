class SdgExplorer::Scraper
  
  def self.scrape_sdgs
    doc = Nokogiri::HTML(open("https://sdgs.un.org/goals"))
    sdgs = doc.css(".card")
    sdgs.each do |s|
      name = s.css(".goal-title").text
      text = s.css(".goal-text").text.strip
      url = s.css("a").attr("href")
      SdgExplorer::Sdg.new(name, text, url) if name!=""
    end
  end
  
  def self.scrape_reports(sdg)
    SdgExplorer::Report.new("2020", sdg)
    SdgExplorer::Report.new("2019", sdg)
  end
end