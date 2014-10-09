require_relative 'csv_parser'
require_relative 'cleaner'

class Repository
  include Cleaner
  include CSVParser

  def populate_repository(csv_path, instance_class)
    parsed_csv     = CSVParser.load_csv(csv_path)
    parsed_csv.map do |raw_element|
      instance     = instance_class.new(raw_element, self)
      repository << instance
    end
  end

  def inspect
    "#<#{self.class} #{@repository.size} rows>"
  end

  def clean(item)
    Cleaner.clean(item)
  end

  def find_by(attribute, criteria)
    answer = repository.find { |instance|
    clean(instance.send(attribute.to_sym)) == clean(criteria) }
  end

  def find_all_by(attribute, criteria)
    repository.select { |instance| clean(instance.send(attribute.to_sym)) == clean(criteria) }
  end

end
