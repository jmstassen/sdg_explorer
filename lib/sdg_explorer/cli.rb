class SdgExplorer::CLI
  def call
    puts ""
    puts "Welcome to SDG Explorer. These are the Sustainable Development Goals:"
    get_sdgs
    list_sdgs
    get_user_sdg
    # get_progress_reports_for(sdg)
    # print_available_progress_reports
    # get_user_progress_report
    # print_progress_report_for(sdg, year)
  end

  def get_sdgs
    @sdgs = SdgExplorer::Sdg.all
  end

  def list_sdgs
    @sdgs.each_with_index do |sdg, index|
     puts "#{index + 1}. #{sdg.name}"
   end
  end
  
  def get_user_sdg
    puts ""
    binding.pry
    puts "Which SDG would you like to explore? Enter a number."
    chosen_sdg = gets.strip.to_i
    show_reports_for(chosen_sdg) if valid_sdg(chosen_sdg, @sdgs)
  end
  
  def valid_sdg(input, data)
    input.to_i <= data.length && input.to_i > 0
  end  
    
  def show_reports_for(chosen_sdg)
    sdg = @sdgs[chosen_sdg - 1]
    sdg.get_reports
    puts "Here are the available annual reports for #{sdg.name}"
    sdg.reports.each_with_index do |r, index|
      puts "#{index +1}. #{r.year}"
    end
  end
end