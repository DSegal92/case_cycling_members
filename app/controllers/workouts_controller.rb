class WorkoutsController < ApplicationController
  # GET /workouts
  # GET /workouts.json
  def index
    if !(current_user)
      redirect_to root_url
    else
      @workouts = Workout.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @workouts }
      end
    end
  end

  # GET /workouts/new
  # GET /workouts/new.json
  def new
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
      @workout = Workout.new
      @exercises = Exercise.all
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @workout }
      end
    end
  end

  # GET /workouts/1/edit
  def edit
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
      @exercises = Exercise.all
      @workout = Workout.find(params[:id])
    end
  end

  # POST /workouts
  # POST /workouts.json
  def create
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
      @workout = Workout.new(params[:workout])

      respond_to do |format|
        if @workout.save
          format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
          format.json { render json: @workout, status: :created, location: @workout }
        else
          format.html { render action: "new" }
          format.json { render json: @workout.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /workouts/1
  # PUT /workouts/1.json
  def update
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
      @workout = Workout.find(params[:id])

      respond_to do |format|
        if @workout.update_attributes(params[:workout])
          format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @workout.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    if !(current_user)
      redirect_to root_url
    elsif (current_user && !(current_user.can_edit))
      redirect_to root_url
    else
      @workout = Workout.find(params[:id])
      @workout.destroy

      respond_to do |format|
        format.html { redirect_to workouts_url }
        format.json { head :no_content }
      end
    end
  end
end
