class ReviewableObjectsController < ApplicationController
  before_filter :authenticate_user!

  # GET /reviewable_objects
  # GET /reviewable_objects.json
  def index
    @reviewable_objects = current_user.reviewable_objects.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviewable_objects }
    end
  end

  # GET /reviewable_objects/1
  # GET /reviewable_objects/1.json
  def show
    @reviewable_object = current_user.reviewable_objects.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reviewable_object }
    end
  end

  # GET /reviewable_objects/new
  # GET /reviewable_objects/new.json
  def new
    @reviewable_object = current_user.reviewable_objects.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reviewable_object }
    end
  end

  # GET /reviewable_objects/1/edit
  def edit
    @reviewable_object = current_user.reviewable_objects.find(params[:id])
  end

  # POST /reviewable_objects
  # POST /reviewable_objects.json
  def create
    @reviewable_object = current_user.reviewable_objects.new(params[:reviewable_object])

    respond_to do |format|
      if @reviewable_object.save
        format.html { redirect_to @reviewable_object, notice: 'Reviewable object was successfully created.' }
        format.json { render json: @reviewable_object, status: :created, location: @reviewable_object }
      else
        format.html { render action: "new" }
        format.json { render json: @reviewable_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviewable_objects/1
  # PUT /reviewable_objects/1.json
  def update
    @reviewable_object = current_user.reviewable_objects.find(params[:id])

    respond_to do |format|
      if @reviewable_object.update_attributes(params[:reviewable_object])
        format.html { redirect_to @reviewable_object, notice: 'Reviewable object was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reviewable_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviewable_objects/1
  # DELETE /reviewable_objects/1.json
  def destroy
    @reviewable_object = current_user.reviewable_objects.find(params[:id])
    @reviewable_object.destroy

    respond_to do |format|
      format.html { redirect_to reviewable_objects_url }
      format.json { head :no_content }
    end
  end
end
