class Filter
  attr_accessor :params, :description  
  
  def initialize(args={})
    self.params = args
    set_fields(args)
  end

  def search_shifts
    Filter.search_shifts(self.params)
  end
  
  def set_fields(args)
    # This works, but if you are familiar with meta programming
    # it would be better to have each param create its own 
    # getter and setter method and set the value
    # but I figured this was more readable
    self.description = args[:description] if args[:description]
  end
  
  class << self
    def search_shifts(params={})
      shifts = Shift
      # add on the search conditions
      params.each_pair do |field, value|
        shifts = shifts.where("LOWER(#{field}) like ?", "%#{value.downcase}%") 
      end  
      shifts
    end
  
  end
end  