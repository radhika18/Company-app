class EmployeesController < ApplicationController
before_action :set_emp ,only: [:show, :edit, :update, :destroy]

def index
	@emps=Employee.all
end

def show
end

def new
@emp=Employee.new
end

def create
	@emp = Employee.new(emp_params)

    respond_to do |format|
      if @emp.save
        format.html { redirect_to @emp, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @emp }
      else
        format.html { render :new }
        format.json { render json: @emp.errors, status: :unprocessable_entity }
      end
    end
end

def edit
end

def update
	respond_to do |format|
      if @emp.update(emp_params)
        format.html { redirect_to @emp, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @emp }
      else
        format.html { render :edit }
        format.json { render json: @emp.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
	 @emp.destroy
    
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
end

private
 
    def emp_params
	params.require(:employee).permit(:name,:email,:project_id,:organization_id)
    end

    def set_emp
    @emp=Employee.find(params[:id])
    end

end
