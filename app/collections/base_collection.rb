class BaseCollection
  attr_accessor :options

  def initialize(options={})
    @options = options
  end

  def items
    ordered_relation
  end

  def count
    base_relation.count
  end

  private

  def base_relation
    fail
  end

  def ordered_relation
    base_relation
  end
end
