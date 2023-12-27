class DepartmentsController < ApplicationController
  # before_action :set_department, only: %i[ show edit update destroy ]

  # GET /departments or /departments.json
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @departments = @hospital.departments
  end

  # GET /departments/1 or /departments/1.json
  def show
    @hospital = Hospital.find(params[:hospital_id])
    department = @hospital.departments
  end

  # GET /departments/new
  def new
    @hospital = Hospital.find(params[:hospital_id])
    @department = @hospital.departments.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments or /departments.json
  def create
    @hospital = Hospital.find(params[:hospital_id])
    @department = @hospital.departments.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to hospital_departments_path(@department), notice: "Department was successfully created." }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1 or /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to department_url(@department), notice: "Department was successfully updated." }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1 or /departments/1.json
  def destroy
    @department.destroy!

    respond_to do |format|
      format.html { redirect_to departments_url, notice: "Department was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def department_params
      params.require(:department).permit(:department_code, :department_name, :hospital_id)
    end
end
