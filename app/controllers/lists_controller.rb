require 'net/http'
require 'uri'
require 'json'
API_URI = URI("https://api.themoviedb.org/3/movie/top_rated?api_key=64dc6e460807e772ce4666843011b36f")

class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy!

    respond_to do |format|
      format.html { redirect_to lists_path, status: :see_other, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, :photo)
    end

    def fetch_api
      Bookmark.delete_all
      Movie.delete_all
      response = Net::HTTP.get_response(API_URI)
      if response.is_a?(Net::HTTPSuccess)
        data = JSON.parse(response.body)
        movies = data['results']

        movies.each do |movie|
          Movie.create!(
            title: movie['title'],
            overview: movie['overview'],
            rating: movie['vote_average'],
            poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
          )
        end
      end
    end
end
