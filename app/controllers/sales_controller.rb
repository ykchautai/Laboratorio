class SalesController < ApplicationController

  def by_user
      response = HTTParty.get(basic_url(4) + params[:user_id], format: :plain)
      if response.code == 200
        if response.size > 2
          rta = JSON.parse response, symbolize_names: true
          render json: rta
        else
          render json: error_msg(404), status: 404
        end
      else
        render json: error_msg(400),  status: 400
      end
    end

    def by_user_badly_done
      response = HTTParty.get(basic_url(3))
      if response.code == 200
        sales = get_sales_by_user(response, params[:user_id].to_i)
        if sales.length > 0
          render json: sales
        else
          render status: 404
        end
      else
        render json: error_msg(400), status: 400
      end
    end

    def get_sales_by_user(array, user_id)
      sales_by_user = Array.new

      for sale in array
        if sale['user_id'] ==  user_id
          sales_by_user << sale
        end
      end
      return sales_by_user
    end

end
