require 'csv'

class Repository

  attr_accessor :objects

  def initialize(objects =[])
    @objects = objects
  end

  def all() @objects end

  def random() @objects.sample end

  def method_missing(meth, *args, &block)
    case
    when meth.to_s =~ /^find_by_(.+)$/     then @objects.detect do |object|
      object.send($1) == args.first
    end
  when meth.to_s =~ /^find_all_by_(.+)$/ then @objects.select do |object|
     object.send($1) == args.first
   end
    else super
    end
  end

  def respond_to?(meth)
    case
    when meth.to_s =~ /^find_by_.*$/ ||
       meth.to_s =~ /^find_all_by_.*$/ then true
    else super
    end
  end

  def inspect
    "#<#{self.class} #{@merchant.size} rows>"
  end

end
