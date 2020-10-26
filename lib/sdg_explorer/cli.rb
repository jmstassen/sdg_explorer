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
     puts "#{index + 1}. #{sdg.text}"
     puts ""
   end
  end
  
  def get_user_sdg
    puts ""
    puts "Which SDG would you like to explore? Enter a number."
    @chosen_sdg = gets.strip.to_i
    if valid_input(@chosen_sdg, @sdgs)
      list_reports_for(@chosen_sdg)
    else
      get_user_sdg
    end
  end
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end  
    
  def list_reports_for(chosen_sdg)
    sdg = @sdgs[chosen_sdg - 1]
    sdg.get_reports
    puts "Here are the available annual reports for #{sdg.name}:"
    sdg.reports.each_with_index do |r, index|
      puts "#{index +1}. #{r.year}"
    end
    puts "Which report would you like to read? Enter single digit."
    chosen_report = gets.strip.to_i
    if valid_input(chosen_report, sdg.reports)
      display_report_for(chosen_report, sdg)
    else
      list_reports_for(@chosen_sdg)
    end
  end
  
  def display_report_for(chosen_report, sdg)
    report = sdg.reports[chosen_report - 1]
    puts "#{sdg.name}: #{sdg.text}"
    puts "#{report.year} Progress Report"
    puts report.content
    puts "What would you like to do?"
    puts "1. See another year for #{sdg.name}"
    puts "2. Choose another SDG"
    puts "3. Exit program"
    user_choice = gets.strip.to_i
    if user_choice == 1
      list_reports_for(@chosen_sdg)
    elsif user_choice == 2
      list_sdgs
      get_user_sdg
    else
    end
  end
    
  
end