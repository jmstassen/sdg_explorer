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
    # to be scraped instead
    @sdg_names = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10", "test11", "test12", "test13", "test14", "test15", "test16", "test17"]
  end

  def list_sdgs
    @sdg_names.each_with_index do |sdg_name, index|
     puts "#{index + 1}. #{sdg_name}"
   end
  end
  
  def get_user_sdg
    puts ""
    puts "Which SDG would you like to explore? Enter a number."
    chosen_sdg = gets.strip.to_i
    show_reports_for(chosen_sdg) if valid_sdg(chosen_sdg, @sdg_names)
  end
  
  def valid_sdg(input, data)
    input.to_i <= data.length && input.to_i > 0
  end  
    
  def show_reports_for(chosen_sdg)
    sdg_name = @sdg_names[chosen_sdg - 1]
    puts "Here are the available annual progress reports for SDG-#{chosen_sdg}. #{sdg_name}"
    binding.pry
  end
end