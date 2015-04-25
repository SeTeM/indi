class UsersCollection < BaseCollection
  private

  def base_relation
    User.all
  end

  def ordered_relation
    base_relation.order(created_at: :desc)
  end
end
