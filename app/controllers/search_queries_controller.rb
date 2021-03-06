class SearchQueriesController < ApplicationController
  before_action :set_search_query, only: [:show, :edit, :update, :destroy]

  # GET /search_queries
  # GET /search_queries.json
  def index
    @search_queries = SearchQuery.all
  end

  # GET /search_queries/1
  # GET /search_queries/1.json
  def show
  end

  # GET /search_queries/new
  def new
    @search_query = SearchQuery.new
  end

  # GET /search_queries/1/edit
  def edit
  end

  # POST /search_queries
  # POST /search_queries.json
  def create
    @search_query = SearchQuery.new(search_query_params)

    respond_to do |format|
      if @search_query.save
        format.html { redirect_to @search_query, notice: 'Search query was successfully created.' }
        format.json { render :show, status: :created, location: @search_query }
      else
        format.html { render :new }
        format.json { render json: @search_query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_queries/1
  # PATCH/PUT /search_queries/1.json
  def update
    respond_to do |format|
      if @search_query.update(search_query_params)
        format.html { redirect_to @search_query, notice: 'Search query was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_query }
      else
        format.html { render :edit }
        format.json { render json: @search_query.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /search_queries/1
  # DELETE /search_queries/1.json
  def destroy
    @search_query = SearchQuery.find(params[:id])
    @search_query.destroy
    redirect_to admin_index_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_query
      @search_query = SearchQuery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_query_params
      params.require(:search_query).permit(:query_string, :query_response)
    end
end
