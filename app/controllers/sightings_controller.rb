class SightingsController < ApplicationController
    def show
        sighting = Sighting.find_by(:id [params[:id]])
        if sighting
            # render json: sighting, except: [:created_at, :updated_at], include: [:bird, :location]
            render json: sighting.to_json(:include=>{
                :bird => {:only => [:name, :species]},
                :location =>{:except =>[:created_at, :updated_at]}
            })
        else 
            render json: {message: "No sighting found with that id"}
        end
    end
end
