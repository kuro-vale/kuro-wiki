class WikiController < ApplicationController
  before_action :set_wiki, only: %i[show edit update destroy]

  # GET /wiki
  def index
    @featured_wikis = Wiki.first(3)
    @wiki = Wiki.all.offset(3)
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
    redirect_to wiki_index_url, notice: 'Wiki was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wiki
    @wiki = Wiki.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
end
