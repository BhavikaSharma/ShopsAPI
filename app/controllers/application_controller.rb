class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound, with: :raise_404

  def raise_404
    render file: "#{Rails.root}/public/404", layout: true, status: :not_found
    head 404, "content_type" => 'application/json'
  end
end
