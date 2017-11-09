class ApplicationController < ActionController::API

  def basic_url(element)
    # Element: 1-productos, 2-Usuarios, 3-Sales, 4-sles por usuarios
    url="http://192.168.99.101"

    case element
      when 1
        url += ":3000/products/"
      when 2
        url += ":3001/users/"
      when 3
        url += ":3002/sales/"
      when 4
        url += ":3002/user/"
    end

    return url
  end

  def error_msg(code)
    case code
    when 404
      json_response = {
        error: "Usuario no encontrado",
        status: 404
      }
    when 201
      json_response = {
        msg: "Venta creada Satisfactoriamente",
        status: 201
      }
    when 204
      json_response = {
        error: "Producto con stock insuficiente",
        status: 204
      }
    when 400
      json_response = {
        error: "Peticion incorrecta",
        status: 400
      }
    end
    return json_response
  end

end
