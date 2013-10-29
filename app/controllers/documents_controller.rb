class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  def index
    if !(current_user)
      redirect_to root_url
    else
      @documents = Document.all

     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @documents }
     end
   end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
     if !(current_user)
      redirect_to root_url
     elsif (current_user && !(current_user.can_edit))
     else
      @document = Document.new

      respond_to do |format|
       format.html # new.html.erb
       format.json { render json: @document }
     end
    end
  end

  # GET /documents/1/edit
  def edit
    if !(current_user)
      redirect_to root_url
     elsif (current_user && !(current_user.can_edit))
     else
        if !(current_user)
          redirect_to root_url
        elsif (current_user && !(current_user.can_edit))
        else
          @document = Document.find(params[:id])
        end
    end
  end

  # POST /documents
  # POST /documents.json
  def create
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
    else
      @document = Document.new(params[:document])

      respond_to do |format|
        if @document.save
          format.html { redirect_to documents_url, notice: 'Document was successfully created.' }
          format.json { render json: @document, status: :created, location: @document }
        else
          format.html { render action: "new" }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
    else
      @document = Document.find(params[:id])

      respond_to do |format|
        if @document.update_attributes(params[:document])
          format.html { redirect_to documents_url, notice: 'Document was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
    else
      @document = Document.find(params[:id])
      @document.destroy

      respond_to do |format|
        format.html { redirect_to documents_url }
        format.json { head :no_content }
      end
    end
  end
end
