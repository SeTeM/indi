module ControllerMacros
  def json
    parsed_body.with_indifferent_access
  end

  private

  def subject_or_responce
    if defined?(subject)
      subject
    elsif defined?(responce)
      responce
    else
      fail "It requires subject or responce"
    end
  end

  def parsed_body
    JSON.parse(subject_or_responce.body)
  end
end

RSpec.configure do |config|
  config.include ControllerMacros, type: :controller
end
