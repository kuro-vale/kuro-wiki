class WikiController < ApplicationController
  include WikiHelper
  before_action :set_wiki, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  # GET /wiki?category=0
  def index
    @featured_wikis = Wiki.first(3)
    @wikis = if params[:category].present? && is_number?(params[:category])
               @category = Wiki.translate_enum(:categories, Wiki.categories.key(params[:category].to_i))
               Wiki.where("category = #{params[:category]}").order(created_at: :DESC).order(created_at: :DESC).page(params[:page])
             elsif params[:query].present?
               @category = params[:query].capitalize
               Wiki.where("title ILIKE '%#{params[:query]}%' OR body ILIKE '%#{params[:query]}%'").order(created_at: :DESC).page(params[:page])
             else
               Wiki.where.not(id: @featured_wikis.map(&:id)).order(created_at: :DESC).page(params[:page])
             end
  end

  # GET /wiki/1
  def show; end

  # GET /wiki/new
  def new
    @wiki = Wiki.new
  end

  # GET /wiki/1/edit
  def edit
    return redirect_to wiki_index_url if @wiki.user.id != current_user.id
  end

  # POST /wiki
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      redirect_to @wiki, notice: t('wiki.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wiki/1
  def update
    return redirect_to wiki_index_url if @wiki.user.id != current_user.id

    if @wiki.update(wiki_params)
      redirect_to @wiki, notice: t('wiki.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /wiki/1
  def destroy
    return redirect_to wiki_index_url if @wiki.user.id != current_user.id

    @wiki.destroy
    redirect_to wiki_index_url(anchor: 'wikis'), notice: t('wiki.destroyed')
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
