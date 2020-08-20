class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    # get the params from the form
    @dose = Dose.new(dose_params)
    # find the right cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    # Assign the cocktail id to the dose.cocktail_id
    @dose.cocktail = @cocktail

    # Save the cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    # also destroy ingredient ?
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
