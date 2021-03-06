class DosesController < ApplicationController


 def new
   @cocktail = Cocktail.find(params[:cocktail_id]) 
   @dose = Dose.new(params[:id])
 end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(params_dose)
    @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end
    
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end   

  private

  def params_dose
    params.require(:doses).permit(:ingredient_id, :description)
  end

end
