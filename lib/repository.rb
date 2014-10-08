require_relative 'csv_parser'             #####add relationships, get tests working, add cleaning for each repo

class Repository

  def populate_repository(parsed_csv, instance_class)     #####fix
    parsed_csv.map do |raw_element|
      instance = instance_class.new                       #####(raw_element and self)
      set_attributes(raw_element, instance)
      repo << instance
    end
  end

  def set_attributes(raw_element, instance)              #####fix
    raw_element.map do |key, value|
      instance.send("#{key}=", value)
    end
  end


  def find_by(attribute, criteria)
    repo.find {|instance| instance.send(attribute.to_sym).downcase == criteria.downcase}
  end

  def find_all_by(attribute, criteria)
    repo.select { |instance| instance.send(attribute.to_sym).downcase == criteria.downcase }
  end

end


# InvoiceItemRepository.new                                                                        # ~> NameError: uninitialized constant InvoiceItemRepository
# InvoiceItemRepository.populate_repository(parser.load_file("../test/csv.csv"), InvoiceItem.new)
