class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    # render json: {
    #   id: cheese.id,
    #   name: cheese.name,
    #   price: cheese.price,
    #   is_best_seller: cheese.is_best_seller
    # }

    # REFACTOR!

    cheeses = Cheese.all
    # render json: cheeses, only: [:id, :name, :price, :is_best_seller]
    # render json: cheeses, only: %i[id name price is_best_seller]
    # Or the reverse, same thing:
    # render json: cheeses, except: %i[created_at updated_at]

    render json: cheese, except: %i[created_at updated_at], methods: [:summary]
  end
end
