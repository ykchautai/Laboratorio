class BuyController < ApplicationController

  def sale
    if params.has_key?(:user_id) and params.has_key?(:product_id)
      result_product = get_item(params[:product_id], 1)
      result_user = get_item(params[:user_id], 2)
      if result_product.blank? or result_user.blank?
        render json: error_msg(400), status: 400
      else
        if result_product['stock'] > 0
          update_stock(result_product)
          create_sale(result_product['id'], result_user['id'])
        else
          render json: error_msg(204), status: 204
        end
      end
    else
      render json: error_msg(400), status: 400
    end
  end

  def create_sale(product_id, user_id)
    options = {
      :body => {
        :product_id => product_id,
        :user_id => user_id
      }.to_json,
      :headers => {
      'Content-Type' => 'application/json'
      }
    }
    results = HTTParty.post(basic_url(3), options)
    render json: error_msg(201), status: 201
  end

  def update_stock(product)
    options = {
      :body => {
        :stock => product['stock'].to_i - 1,
      }.to_json,
      :headers => {
      'Content-Type' => 'application/json'
      }
    }
    results = HTTParty.put(basic_url(1)+product['id'].to_s, options)
  end

  def get_item(id, element)
    response = HTTParty.get(basic_url(element) + id.to_s)
    if response.code == 200
      return response
    else
      return nil
    end
  end
end
