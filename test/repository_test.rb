require_relative 'helper_test'
require './lib/csv_parser'
require './lib/repository'

class RepositoryTest < Minitest::Test

  def repository
    @repository = []
  end

  class Merchant
    attr_reader :id,
                :name,
                :created_at,
                :updated_at

    def initialize(data, repository)
      @id          = data[:id]
      @name        = data[:name]
      @created_at  = data[:created_at]
      @updated_at  = data[:updated_at]
      @repository  = repository
    end
  end

  class MerchantRepository < Repository
    attr_reader :repository

    def initialize
      @repository = []
    end

    def find_by_id(arg); finder(:id, arg); end
    def find_by_name(arg); finder(:name, arg); end
    def find_by_created_at(arg); finder(:created_at, arg); end
    def find_by_updated_at(arg); finder(:updated_at, arg); end
  end

  def test_it_can_load_an_id
    @merchants_test = CSVParser.new.load_csv("./data/merchants_test.csv")
    @merchant_repository = MerchantRepository.new
    @merchant = Merchant
    @merchant_repository.populate_repository(@merchants_test, @merchant)
    assert_equal 1, @merchant_repository.repository[0].id
  end

end
