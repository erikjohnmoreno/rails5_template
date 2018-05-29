module CommonActions
  extend ActiveSupport::Concern

  included do
    before_action :find_obj, except: [:index,:create]
  end

  def all
    obj_klass = eval(resource_name)
    render json: {
      collection: obj_klass.all.order('id ASC'),
    }
  end

  def index
    render json: {
      collection: obj_klass.order('id DESC').by_limit(params[:page], 10),
      metadata: {count: obj_klass.count, current_page: params[:page]}
    }
  end

  def create
    @obj = eval(resource_name).new(obj_params)
    if @obj.save
      render_obj
    else
      obj_errors
    end
  end

  def update
    if @obj.update_attributes(obj_params)
      render_obj
    else
      obj_errors
    end
  end

  def destroy
    if @obj.destroy
      render_success
    else
      obj_errors
    end
  end

  def show
    render_obj
  end

  def fetch_by_token model_name
    @obj = eval(model_name).find_by(token: params[:token])
    render json: Users::Builder.new.basic_details(@obj.user)
  end

  protected

  #
  # NOTE: resource_name must be defined inside a controller
  #
  def find_obj
    @obj = eval(resource_name).find_by(id: params[:id])
  end
end
