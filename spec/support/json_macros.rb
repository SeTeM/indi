module JsonMacros
  def json
    body = if subject.is_a?(ActionController::TestResponse)
      subject.body
    else
      response.body
    end
    JSON.parse body, object_class: HashWithIndifferentAccess
  end
end

RSpec.configure do |config|
  config.include JsonMacros, type: :controller
end
