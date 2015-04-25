class API::TagsController < API::BaseController
  def index
    load_tags
    render_tags
  end

  private

  def load_tags
    @tags = TagsCollection.new.items
  end

  def render_tags
    render json: @tags
  end
end
