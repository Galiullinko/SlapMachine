class SlapsController < ApplicationController
  before_action :set_slap, only: [:show, :edit, :update, :destroy]

  # GET /slaps
  # GET /slaps.json
  def index
    @slaps = Slap.all
    slapper = params[:slapper]
    victim = params[:victim]
    @slap = slapper.to_s + ' ' + Slap.offset(rand(Slap.count)).first.text + ' ' + victim.to_s
  end

  # GET /slaps/1
  # GET /slaps/1.json
  def show
  end

  # GET /slaps/new
  def new
    @slap = Slap.new
  end

  # GET /slaps/1/edit
  def edit
  end

  # POST /slaps
  # POST /slaps.json
  def create
    @slap = Slap.new(slap_params)

    respond_to do |format|
      if @slap.save
        format.html { redirect_to @slap, notice: 'Slap was successfully created.' }
        format.json { render :show, status: :created, location: @slap }
      else
        format.html { render :new }
        format.json { render json: @slap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slaps/1
  # PATCH/PUT /slaps/1.json
  def update
    respond_to do |format|
      if @slap.update(slap_params)
        format.html { redirect_to @slap, notice: 'Slap was successfully updated.' }
        format.json { render :show, status: :ok, location: @slap }
      else
        format.html { render :edit }
        format.json { render json: @slap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slaps/1
  # DELETE /slaps/1.json
  def destroy
    @slap.destroy
    respond_to do |format|
      format.html { redirect_to slaps_url, notice: 'Slap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slap
      @slap = Slap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slap_params
      params.require(:slap).permit(:text)
    end
end
