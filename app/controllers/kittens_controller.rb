class KittensController < ApplicationController
    def index
        @kittens = Kitten.all

        respond_to do |format|
            format.html # index.html.erb
            format.json { render :json => @kittens }
        end
    end

    def show
        @kitten = Kitten.find(params[:id])

        respond_to do |format|
            format.html # index.html.erb
            format.json { render :json => @kitten }
        end
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)

        if @kitten.save
            flash[:success] = 'Kitten successfully created'
            redirect_to kittens_path
        else
            flash[:error] = 'That kitten just ran away from you. Go catch it!'
            render :new, status: :unprocessable_entity
        end      
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])
        
        if @kitten.update(kitten_params)
            flash[:success] = 'Kitten successfully updated'
            redirect_to kitten_path(@kitten)
        else
            flash[:error] = 'That Kitten didnt want to change its status. Guess you need to sweet-talk it more into it.'
            render :new, status: :unprocessable_entity
        end  
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy

        flash[:success] = 'Kitten succesfully destroyed you'
        redirect_to kittens_path
    end

    private

    def kitten_params
        params.require(:kitten).permit(:id, :name, :age, :cuteness, :softness)
    end
end
