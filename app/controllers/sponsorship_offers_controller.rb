class SponsorshipOffersController < ApplicationController
  # GET /sponsorship_offers
  # GET /sponsorship_offers.json
  def index
    if !(current_user)
      redirect_to root_url
    else
      @sponsorship_offers = SponsorshipOffer.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @sponsorship_offers }
      end
    end
  end

  def show
    redirect_to sponsorship_offers_path
  end

  # GET /sponsorship_offers/new
  # GET /sponsorship_offers/new.json
  def new
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
      @sponsorship_offer = SponsorshipOffer.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @sponsorship_offer }
      end
    end
  end

  # GET /sponsorship_offers/1/edit
  def edit
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
      @sponsorship_offer = SponsorshipOffer.find(params[:id])
    end
  end

  # POST /sponsorship_offers
  # POST /sponsorship_offers.json
  def create
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
      @sponsorship_offer = SponsorshipOffer.new(params[:sponsorship_offer])

      respond_to do |format|
        if @sponsorship_offer.save
          format.html { redirect_to @sponsorship_offer, notice: 'Sponsorship offer was successfully created.' }
          format.json { render json: @sponsorship_offer, status: :created, location: @sponsorship_offer }
        else
          format.html { render action: "new" }
          format.json { render json: @sponsorship_offer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /sponsorship_offers/1
  # PUT /sponsorship_offers/1.json
  def update
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
      @sponsorship_offer = SponsorshipOffer.find(params[:id])

      respond_to do |format|
        if @sponsorship_offer.update_attributes(params[:sponsorship_offer])
          format.html { redirect_to @sponsorship_offer, notice: 'Sponsorship offer was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @sponsorship_offer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /sponsorship_offers/1
  # DELETE /sponsorship_offers/1.json
  def destroy
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
      @sponsorship_offer = SponsorshipOffer.find(params[:id])
      @sponsorship_offer.destroy

      respond_to do |format|
        format.html { redirect_to sponsorship_offers_url }
        format.json { head :no_content }
      end
    end
  end
end
