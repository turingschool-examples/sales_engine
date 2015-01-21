require_relative '../lib/sales_engine'

module SalesEngineSpecHelpers
  class << self
    attr_accessor :engine
  end

  def engine
    self.class.engine
  end
end

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.before(:suite) do
    SalesEngineSpecHelpers.engine = SalesEngine.new
    SalesEngineSpecHelpers.engine.startup
  end

  config.include Module.new {
    def engine
      SalesEngineSpecHelpers.engine
    end
  }
end
