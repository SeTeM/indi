class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :name, :email, :about, :hired_at, :userpic
end
