class SdgExplorer::CLI
  def call
    puts "Welcome to SDG Explorer"
    get_sdg_names
    get_user_sdg
    # get_progress_reports_for(sdg)
    # print_available_progress_reports
    # get_user_progress_report
    # print_progress_report_for(sdg, year)
  end

  def get_sdg_names
    # to be scraped instead
    @sdg_names = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10", "test11", "test12", "test13", "test14", "test15", "test16", "test17"]
  end

  def get_user_sdg
    # list sdg_names
    @sdg_names.each_with_index do |sdg_name, index|
     puts "#{index + 1}. #{sdg_name}"
   end
  end
end