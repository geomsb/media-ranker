class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  private
	def work_params
  return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
End

end


