require_relative 'csv_parser'

class Repository

  def populate_repository(parsed_csv, instance_class)
    parsed_csv.map do |raw_element|
      instance = instance_class.new
      set_attributes(raw_element, instance)
      repo << instance
    end
  end

  def set_attributes(raw_element, instance)
    raw_element.map do |key, value|
      instance.send("#{key}=", value)
    end
  end


  def finder(attribute, criteria)
    repo.find {|instance| instance.attribute == criteria}
  end

end


# InvoiceItemRepository.new
# InvoiceItemRepository.populate_repository(parser.load_file("../test/csv.csv"), InvoiceItem.new)
