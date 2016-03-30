class OrganizationsController < ApplicationController
before_action :set_organization , only: [:show,:edit,:destroy,:update]

def index
@organizations=Organization.all
  #  respond_to do |format|
   # format.html
   # format.csv { send_data @organizations.to_csv }
  #end 
end

def show
  
end

def display
@org_ids= Organization.where(id: params[:organization_ids])
  respond_to do |format|
    format.html
    format.csv { send_data @org_ids.to_csv}
  end 
end


def show_data
  @organizations = Organization.all
end

def new
@organization=Organization.new
end

def create
@organization=Organization.new(org_params)
  respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end

end

def edit
end

def update
respond_to do |format|
	if @organization.update(org_params)
        format.html { redirect_to @organization, notice: 'Organization details are successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
	@organization.destroy
	respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end

end


private

def org_params
  params.require(:organization).permit(:name,:location)
end

def set_organization
	@organization=Organization.find(params[:id])
end
end
