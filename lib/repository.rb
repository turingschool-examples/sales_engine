require_relative 'csv_parser'

class Repository

  def populate_repository(parsed_csv, instance_class)
    parsed_csv.map do |hash|
      instance = instance_class.new
      set_attributes(hash, instance)
      repo << instance
    end
  end

  def set_attributes(hash, instance)
    hash.map { |key, value| instance.key = value }
  end

  def finder(attribute, criteria)
    repo.find {|instance| instance.send(attribute) == criteria}
  end

end


=======================

InvoiceItemRepository.new
InvoiceItemRepository.populate_repository(parser.load_file("../test/csv.csv"), InvoiceItem.new)
