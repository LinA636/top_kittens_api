class KittensController < ApplicationController
    def index
        @kittens = Kitten.all
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new()

        if @kitten.save
            redirect_to kittens_path, notice: 'Kitten successfully created'
        else
            render :new, status: :unprocessable_entity, notice: 'That kitten just ran away from you. Go catch it!'
        end      
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])
        
        if @kitten.update(kitten_params)
            redirect_to kitten_path(@kitten), notice: 'Kitten successfully created'
        else
            render :new, status: :unprocessable_entity, notice: 'That Kitten didnt want to change its status. Guess you need to sweet-talk it more into it.'
        end  
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy

        redirect_to kittens_path, notice: 'Kitten succesfully destroyed you'
    end
end
