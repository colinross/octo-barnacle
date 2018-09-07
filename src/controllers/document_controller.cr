class DocumentController < ApplicationController
  getter document = Document.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_document }
  end

  def index
    documents = Document.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def update
    document.set_attributes document_params.validate!
    if document.save
      redirect_to action: :index, flash: {"success" => "Updated document successfully."}
    else
      flash["danger"] = "Could not update Document!"
      render "edit.slang"
    end
  end

  def create
    document = Document.new document_params.validate!
    if document.save
      redirect_to action: :index, flash: {"success" => "Created document successfully."}
    else
      flash["danger"] = "Could not create Document!"
      render "new.slang"
    end
  end

  def destroy
    document.destroy
    redirect_to action: :index, flash: {"success" => "Deleted document successfully."}
  end

  private def document_params
    params.validation do
      required :name { |f| !f.nil? }
      required :description { |f| !f.nil? }
    end
  end

  private def set_document
    @document = Document.find! params[:id]
  end
end
