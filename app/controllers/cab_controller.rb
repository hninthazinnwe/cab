class CabController < ApplicationController
  # before_action :load_and_authorize_resource
    
  def list
    @cabs = ::Cab.all
    # puts @cabs.to_ary[0]
    puts 'list----------------------'
  end
  
  def show
    @cab = Cab.find(params[:id])
    puts @cab.car_photo
    puts 'show ++++++++++++++++++++'
  end

  def new
    @cab = Cab.new
  end
  
  def create
    puts 'create----------------------'
    @cab = Cab.new(cab_params)
    if params[:cab].present?
      file = params[:cab][:car_photo]
      File.open(Rails.root.join('public','asset', 'images', file), 'wb') do |f|
        f.write(file)
      end
    end
    @cab.save
    redirect_to :action => 'list'
  end
  
  def edit
    @cab = Cab.find(params[:id])
  end
  
  def update
    @cab = Cab.find(params[:id])
    if params[:cab].present?
      file = params[:cab][:car_photo]
      File.open(Rails.root.join('public','asset', 'images', file), 'wb') do |f|
        f.write(file)
      end
    end
    @cab.update(cab_params)
    redirect_to :action => 'show', :id => @cab
  end
  
  def delete
    Cab.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def download
    # @cabs = ::Cab.getAll
    @cabs = ::Cab.all
    respond_to do |format|
      format.html
      format.xlsx { set_attachment_name "sites #{Time.now.utc.strftime('%Y%M%d%H%M%S')}.xlsx" }
    end
  end

  def cab_params
    params.require(:cab).permit(:plate_number, :model, :mileage, :car_photo)
  end

end
