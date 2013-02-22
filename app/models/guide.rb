class Guide
  
  attr_accessor :region, :sport
    
  def initialize (region,sport,search_string)
    @region = region
    @sport = sport
    @search_string = search_string
  end
  
  def programs_for_html # a hash of all matching current programs for the specified region and sport
      programs = Program.includes(:channel, :sport).current
      programs = programs.where("channels.black_flag IS NULL or channels.black_flag != ?", true)
      programs = programs.where("region_id = ?", @region.id) unless @region.nil?
      programs = programs.where("sport_id = ?", @sport.id) unless @sport.nil?
      programs = programs.where("title like ? or subtitle like ?", "%#{@search_string}%", "%#{@search_string}%") unless (@search_string.nil? || @search_string.empty?)
      programs = programs.format_and_sort_for_html
    
    end
    
 
end