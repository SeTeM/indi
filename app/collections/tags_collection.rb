class TagsCollection < BaseCollection
  private

  def base_relation
    Tag.all
  end

  def ordered_relation
    base_relation.order(created_at: :desc)
  end
end
