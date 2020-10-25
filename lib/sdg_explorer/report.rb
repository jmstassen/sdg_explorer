class SdgExplorer::Report
  @@all = []
  attr_accessor :year, :sdg, :content
  
  def initialize(year, sdg, content)
    @year = year
    @sdg = sdg
    @content = content
    add_to_sdg
    save
  end
  
  def self.all
    @@all
  end
  
  def add_to_sdg
    @sdg.reports << self unless @sdg.reports.include?(self)
  end
  
  def save
    @@all << self
  end
  
end