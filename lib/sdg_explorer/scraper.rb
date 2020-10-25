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
    doc = Nokogiri::HTML(open("#{sdg.url}"))
    reports = doc.css("section.text-formatted")
    reports.each do |r|
      year = r.attr("class").delete("^0-9")
      content = r.text.strip
      SdgExplorer::Report.new(year, sdg, content)
    end
  end
end