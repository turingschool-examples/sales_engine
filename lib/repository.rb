require_relative 'csv_parser'             #####add relationships, get tests working, add cleaning for each repo

class Repository

  def populate_repository(parsed_csv, instance_class)     #####fix
    parsed_csv.map do |raw_element|
      instance = instance_class.new(raw_element, self)                      #####(raw_element and self)
      repo << instance
    end
  end

  def find_by(attribute, criteria)
    repo.find {|instance| instance.send(attribute.to_sym).downcase == criteria.downcase}
  end

  def find_all_by(attribute, criteria)
    repo.select { |instance| instance.send(attribute.to_sym).downcase == criteria.downcase }
  end

end
