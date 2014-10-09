require_relative 'csv_parser'             #####add relationships, get tests working, add cleaning for each repo
require_relative 'cleaner'

class Repository
  include Cleaner

  def populate_repository(parsed_csv, instance_class)     #####fix
    parsed_csv.map do |raw_element|
      instance = instance_class.new(raw_element, self)                      #####(raw_element and self)
      repo << instance
    end
  end

  def inspect
    "#<#{self.class} #{@repo.size} rows>"
  end

  def clean(item)
    Cleaner.clean(item)
  end

  def find_by(attribute, criteria)
    repo.find { |instance| clean(instance.send(attribute.to_sym)) == clean(criteria) }
  end

  def find_all_by(attribute, criteria)
    repo.select { |instance| clean(instance.send(attribute.to_sym)) == clean(criteria) }
  end

end
