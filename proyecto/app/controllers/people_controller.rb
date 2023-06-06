class PeopleController < ApplicationController
    def index
      @people = Person.all
    end
  
    def new
      @person = Person.new
    end
  
    def edit
      @person = Person.find(params[:id])
    end
  
    def show
      @person = Person.find(params[:id])
    end
  
    def create
      @person = Person.new(person_params)
      if @person.save
        flash[:notice] = "Registro guardado"
        redirect_to person_path(@person)
      else
        flash[:alert] = "Ha ocurrido un problema"
        render :new
      end
    end
    def update
      @person = Person.find(params[:id])
        if @person.update(person_params)
          redirect_to person_path (@person)
        else
          render :edit
        end
    end

    private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:identificacion, :first_name, :second_name, :first_last_name, :second_last_name, :role_id, :document_id)
    end
end
