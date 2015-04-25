class BasePersistingService
  attr_reader :object

  def initialize(object, attributes = {})
    @object = object
    object.assign_attributes attributes
  end

  def save
    perform_after if persist
    object
  end

  def destroy
    perform_after if destroy_object
    object
  end

  def success?
    errors.blank?
  end

  def errors
    object.errors
  end

  private

  def persist
    object.class.transaction do
      perform_before
      object.save
    end
  end

  def destroy_object
    object.class.transaction do
      perform_before
      object.destroy
    end
  end

  def ex(attr)
    object.previous_changes[attr].to_a.first || object.send(attr)
  end

  def perform_before
  end

  def perform_after
  end
end
