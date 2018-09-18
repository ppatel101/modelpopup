class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  require 'csv'

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    respond_to do |format|
      format.html
      format.csv { send_data @students.to_csv }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      @errorsurname = []
      @errorfirstname = []
      @errorlastname = []
      @errordiv = []
      @errormobileno = []
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
        format.js{ }
      else
        #format.html { render :new }
        # format.json { render json: @student.errors, status: :unprocessable_entity }
        format.js{ }
        @student.errors.any?
          if (@student.errors["surname"] != nil)
            @errorsurname.push(@student.errors["surname"][0])
          end
          if (@student.errors["firstname"] != nil)
            @errorfirstname.push(@student.errors["firstname"][0])
          end
          if (@student.errors["lastname"] != nil)
            @errorlastname.push(@student.errors["lastname"][0])
          end
          if (@student.errors["div"] != nil)
            @errordiv.push(@student.errors["div"][0])
          end
          if (@student.errors["mobileno"] != nil)
            @errormobileno.push(@student.errors["mobileno"][0])
          end
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      @errorsurname = []
      @errorfirstname = []
      @errorlastname = []
      @errordiv = []
      @errormobileno = []
      if @student.update(student_params)
        format.html { redirect_to students_url, notice: 'Student was successfully updated.' }
        format.json { render :index, status: :ok, location: @student }
        format.js{ }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
        format.js{ }
        @student.errors.any?
          if (@student.errors["surname"] != nil)
            @errorsurname.push(@student.errors["surname"][0])
          end
          if (@student.errors["firstname"] != nil)
            @errorfirstname.push(@student.errors["firstname"][0])
          end
          if (@student.errors["lastname"] != nil)
            @errorlastname.push(@student.errors["lastname"][0])
          end
          if (@student.errors["div"] != nil)
            @errordiv.push(@student.errors["div"][0])
          end
          if (@student.errors["mobileno"] != nil)
            @errormobileno.push(@student.errors["mobileno"][0])
          end
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
      format.js{ }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:surname, :firstname, :lastname, :div, :mobileno)
    end
end
