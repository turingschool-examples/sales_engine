# 
class Repository

  attr_accessor :objects

  def initialize(objects =[])
    @objects = objects
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def all
    @objects
  end

  def random
    @objects.sample
  end

  def method_missing(meth, *args, &block)
    if meth.to_s    =~ /^find_by_(.+)$/
      @objects.detect { |object| object.send($1) == args.first }
    elsif meth.to_s =~ /^find_all_by_(.+)$/
      objects.select { |object| object.send($1) == args.first }
    else
      super
    end
  end

  def respond_to?(meth)
    if meth.to_s =~ /^find_by_.*$/
      true
    elsif meth.to_s =~ /^find_all_by_.*$/
      true
    else
      super
    end
  end


end
