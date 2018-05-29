module CommonResponse
  extend ActiveSupport::Concern

  def render_collection collection=nil, metadata=nil
    render json: {collection: (collection || @collection), metadata: metadata}
  end

  def render_obj obj = nil
    obj ||= @obj
    render json: obj
  end

  def render_service_obj obj = nil
    render json: @service.obj
  end

  def render_success
    render json: {success: true}
  end

  def obj_errors obj=nil
    obj ||= @obj
    render json: { message: 'Validation failed', errors: [obj.errors.messages] }, status: 422
  end

  def render_error(error)
    render json: { errors: [error] }, status: 422
  end

  def empty_success
    render json: { }
  end

end
