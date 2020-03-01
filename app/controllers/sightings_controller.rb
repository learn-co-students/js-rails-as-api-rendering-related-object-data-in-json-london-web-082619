class SightingsController < ApplicationController
    def show 
        sighting = Sighting.find_by(id: params[:id])
        render json: sighting.to_json(:include => {
            :bird => {:only => [:name, :species]},
            :location => {:only => [:latitude, :longitude]}
        },
            :except => [:updated_at])
    
        # if sighting 
        # render json: sighting.to_json([:bird, :location])
        # else
        # render json: {message: "No sighting found with that id"}
        # end
    end
    
    def index 
        sightings = Sighting.all 
        render json: sightings.to_json(include: [:bird, :location])
    end
end
