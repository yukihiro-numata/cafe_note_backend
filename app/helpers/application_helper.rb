module ApplicationHelper
  def render200_with_array(array_data:, serializer:)
    render json: array_data, root: 'data', adapter: :json, each_serializer: serializer, status: :ok
  end

  def render200(data:, serializer:)
    render json: data, root: 'data', adapter: :json, serializer: serializer, status: :ok
  end

  def render400
    render json: { status: 'ERROR', message: 'Invalid Parameter' }, status: :bad_request
  end

  def render500
    render json: { status: 'ERROR', message: 'Could not create cafe' }, status: :internal_server_error
  end
end
