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
     puts ""
   end
  end
  
  def get_user_sdg
    puts ""
    puts "Which SDG would you like to explore? Enter a number."
    chosen_sdg = gets.strip.to_i
    show_reports_for(chosen_sdg) if valid_sdg(chosen_sdg, @sdgs)
  end
  
  def valid_sdg(input, data)
    input.to_i <= data.length && input.to_i > 0
  end  
    
  def show_reports_for(chosen_sdg)
    sdg_name = @sdgs[chosen_sdg - 1].name
    puts "Here are the available annual progress reports for SDG-#{chosen_sdg} (#{sdg_name})"
  end
end