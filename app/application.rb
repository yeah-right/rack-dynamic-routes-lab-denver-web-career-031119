class Application

  @@items = [Item.new("Orange", 5.50), Item.new("Onion", 3.5)]

  # def call(env)
  #   resp = Rack::Response.new
  #   req = Rack::Request.new(env)
  # end
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if the_item =@@items.find{|i| i.name == item_name}
        resp.write the_item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status=404
      resp.write "Route not found"
    end
    resp.finish
  # if req.path.match(/items/)
  #   the_item_name = req.path.split("/items/").last
  #   @@items.find do |item|
  #     if item.name == the_item_name
  #       resp.write item.price
  #     else
  #       resp.status = 404
  #       resp.write "Item not found"
  #     end
  #   end
  #   resp.finish
  end
end
