class MembersController < ApplicationController
  require 'securerandom'
  # GET /members
  # GET /members.json
  def index
    if !(current_user)
      redirect_to root_url
    else
    @members = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end
end

  def confirm
    @email = params[:email]
    @confirmation = params[:confirmation]
    @member = Member.find_by_email(@email)
    if @member.creation_hex = @confirmation
      @member.is_confirmed = true
      if @member.save
        AccountCreation.newUser(@email, @member.name, @member.id).deliver
        redirect_to root_url, :notice => "Your account has successfully been created, once an officer verifies your account you will be able to access this site."
      else
       redirect_to root_url, :notice => "Email or confirmation were invalid"
      end
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    if !(current_user)
      redirect_to root_url
    else
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end
end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    if (current_user && current_user.can_edit)
      @member = Member.find(params[:id])
    else
      redirect_to root_url
    end
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])
    @member.creation_hex = SecureRandom.urlsafe_base64
    @member.is_officer = false
    respond_to do |format|
      if @member.save
        email = @member.email
        name = @member.name
        creation_hex = @member.creation_hex
        AccountCreation.newAccount(email, name, creation_hex).deliver

        format.html { redirect_to root_url, notice: 'You have successfully created an account, before you can be added as a dues paying member of the club please check your email to verify your email account.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    if (current_user && current_user.can_edit)
      @member = Member.find(params[:id])
    
      respond_to do |format|
        if @member.update_attributes(params[:member])
           if (params[:member][:position_ids])
            @member.is_officer = true
          else
           @member.is_officer = false
          end
          if params[:member][:is_verified]
            @member.is_confirmed = true
          end
           @member.save
          format.html { redirect_to @member, notice: 'Member was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end
end
