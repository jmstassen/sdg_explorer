class SdgExplorer::CLI
  def call
    puts ""
    puts "Welcome to SDG Explorer. These are the Sustainable Development Goals:".colorize(:blue)
    get_sdgs
    list_sdgs
  end

  def get_sdgs
    @sdgs = SdgExplorer::Sdg.all
  end

  def list_sdgs
    @sdgs.each_with_index do |sdg, index|
     puts "#{index + 1}".colorize(:red)  + ". #{sdg.text}"
     puts ""
   end
   get_user_sdg
  end
  
  def get_user_sdg
    puts "Which SDG would you like to explore? Enter a number.".colorize(:red)
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
    @sdg = @sdgs[chosen_sdg - 1]
    @sdg.get_reports
    puts ""
    puts "Here are the available annual reports for #{@sdg.name}:".colorize(:blue)
    @sdg.reports.each_with_index do |r, index|
      puts "#{index +1}".colorize(:red) + ". #{r.year}"
    end
    get_user_report
  end
  
  def get_user_report
    puts ""
    puts "Which report would you like to read? Enter single digit.".colorize(:red)
    chosen_report = gets.strip.to_i
    if valid_input(chosen_report, @sdg.reports)
      display_report_for(chosen_report, @sdg)
    else
      get_user_report
    end
  end
  
  def display_report_for(chosen_report, sdg)
    report = sdg.reports[chosen_report - 1]
    puts "#{@sdg.name}: #{@sdg.text}".colorize(:blue)
    puts "#{report.year} Progress Report".colorize(:red)
    puts report.content
    get_user_choice
  end
  
  def get_user_choice
    puts ""
    puts "What would you like to do? Enter a number.".colorize(:red)
    puts "1".colorize(:red) + ". See another year for #{@sdg.name}"
    puts "2".colorize(:red) + ". Choose another SDG"
    puts "3".colorize(:red) + ". Exit program"
    user_choice = gets.strip.to_i
    if user_choice == 1
      list_reports_for(@chosen_sdg)
    elsif user_choice == 2
      list_sdgs
    elsif user_choice == 3
      puts "Thank you. Have a nice day.".colorize(:blue)
    else
      get_user_choice
    end
  end
end