require_relative "./sdg_explorer/version"
require_relative "./sdg_explorer/cli"
require_relative "./sdg_explorer/sdg"
require_relative "./sdg_explorer/scraper"
require_relative "./sdg_explorer/report"

require "pry"
require "nokogiri"
require "open-uri"

module SdgExplorer
  class Error < StandardError; end
  # Your code goes here...
end
