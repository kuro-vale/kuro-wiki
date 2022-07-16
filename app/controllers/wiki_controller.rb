class WikiController < ApplicationController
  include WikiHelper
  before_action :set_wiki, only: %i[show edit update destroy]

  # GET /wiki?category=0
  def index
    @featured_wikis = Wiki.first(3)
    @wikis = if params[:category].present? && is_number?(params[:category])
               @category = Wiki.categories.key(params[:category].to_i).capitalize
               Wiki.where("category = #{params[:category]}").order(created_at: :DESC)
             else
               Wiki.all.limit(Wiki.count - 3).order(created_at: :DESC)
             end
  end

  # GET /wiki/1
  def show; end

  # GET /wiki/new
  def new
    @wiki = Wiki.new
  end

  # GET /wiki/1/edit
  def edit; end

  # POST /wiki
  def create
    @wiki = Wiki.new(wiki_params)

    if @wiki.save
      redirect_to @wiki, notice: 'Wiki was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wiki/1
  def update
    if @wiki.update(wiki_params)
      redirect_to @wiki, notice: 'Wiki was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /wiki/1
  def destroy
    @wiki.destroy
    redirect_to wiki_index_url(anchor: 'wikis'), notice: 'Wiki was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wiki
    @wiki = Wiki.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def wiki_params
    params.require(:wiki).permit(:title, :body, :category)
  end
end
