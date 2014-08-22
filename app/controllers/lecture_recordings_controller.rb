class LectureRecordingsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource except: [:create]
  before_action :set_lecture_recording, only: [:show, :edit, :update, :destroy]

  # GET /lecture_recordings
  # GET /lecture_recordings.json
  def index
    @lecture_recordings = LectureRecording.all
  end

  # GET /lecture_recordings/1
  # GET /lecture_recordings/1.json
  def show
  end

  # GET /lecture_recordings/new
  def new
    @lecture_recording = LectureRecording.new
  end

  # GET /lecture_recordings/1/edit
  def edit
  end

  # POST /lecture_recordings
  # POST /lecture_recordings.json
  def create
    @lecture_recording = current_user.lecture_recordings.create(lecture_recording_params)

    respond_to do |format|
      if @lecture_recording.save
        format.html { redirect_to @lecture_recording, notice: 'Lecture recording was successfully created.' }
        format.json { render :show, status: :created, location: @lecture_recording }
      else
        format.html { render :new }
        format.json { render json: @lecture_recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecture_recordings/1
  # PATCH/PUT /lecture_recordings/1.json
  def update
    respond_to do |format|
      if @lecture_recording.update(lecture_recording_params)
        format.html { redirect_to @lecture_recording, notice: 'Lecture recording was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture_recording }
      else
        format.html { render :edit }
        format.json { render json: @lecture_recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecture_recordings/1
  # DELETE /lecture_recordings/1.json
  def destroy
    @lecture_recording.destroy
    respond_to do |format|
      format.html { redirect_to lecture_recordings_url, notice: 'Lecture recording was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture_recording
      @lecture_recording = LectureRecording.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_recording_params
      params.require(:lecture_recording).permit(:name, :raw_video)
    end
end