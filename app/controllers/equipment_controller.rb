class EquipmentController < ApplicationController
  # GET /equipment
  # GET /equipment.json
  def index
     if !(current_user)
      redirect_to root_url
    else
    @equipment = Equipment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @equipment }
    end
  end
  end

  # GET /equipment/new
  # GET /equipment/new.json
  def new
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
    @equipment = Equipment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @equipment }
    end
  end
  end

  # GET /equipment/1/edit
  def edit
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
    @equipment = Equipment.find(params[:id])
  end
  end

  # POST /equipment
  # POST /equipment.json
  def create
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
    @equipment = Equipment.new(params[:equipment])

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to equipment_index_url, notice: 'Equipment was successfully created.' }
        format.json { render json: @equipment, status: :created, location: @equipment }
      else
        format.html { render action: "new" }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PUT /equipment/1
  # PUT /equipment/1.json
  def update
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
    @equipment = Equipment.find(params[:id])
    if !(params[:equipment][:registration])
      @equipment.member_ids = []
    end
    respond_to do |format|
      if @equipment.update_attributes(params[:equipment])
        format.html { redirect_to equipment_index_url, notice: 'Equipment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
    @equipment = Equipment.find(params[:id])
    @equipment.destroy

    respond_to do |format|
      format.html { redirect_to equipment_index_url }
      format.json { head :no_content }
    end
    end
  end


  # def request
  #   name = current_user.name
  #   email = current_user.email
  #   EquipmentRequest.newRequest(name, email).deliver
  #   respond_to do |format|
  #     format.html { redirect_to equipment_index_url, notice: 'Your requestion has been sent to the Equipment Manager'}
  #   end
  # end
end
