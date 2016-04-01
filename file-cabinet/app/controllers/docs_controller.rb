class DocsController < ApplicationController
  # run a method first before executing the controller
  before_action :find_doc, only: [:show, :edit, :update, :destroy]
  def index
    # load documents
    @docs = Doc.all.order("created_At DESC")
  end

  def show
  end

  def new
    # create new docs model
    @doc = Doc.new
  end

  def create
    @doc = Doc.new(doc_params)

    # If model @doc successfully saved redirect to @doc else render new controller
    if @doc.save
      # redirect to single docs view
      redirect_to @doc
    else 
      render 'new'
    end
  end

  def edit
    # responsible for edit view
  end

  def update
    # responsible for update logic
    if @doc.update(doc_params)
      redirect_to @doc
    else
      render 'edit'
    end
  end

  def destroy
    @doc.destroy
    redirect_to docs_path
  end

  private
    def find_doc
      @doc = Doc.find(params[:id])
    end

    def doc_params
      params.require(:doc).permit(:title, :content)
    end
end
