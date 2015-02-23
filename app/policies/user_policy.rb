class UserPolicy < Struct.new(:user)
  DI_HOSTS = %w(dreamindustries.co bookmate.com zvooq.ru).freeze

  def belongs_to_team?
    DI_HOSTS.any? do |host|
      user.email.include?("@#{host}")
    end
  end
end
