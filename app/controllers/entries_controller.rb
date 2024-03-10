class EntriesController < ApplicationController
  before_action :set_current_user

  def new
    @current_user = User.find_by({"id" => session["user_id"]})
    @entry = Entry.new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry.uploaded_image.attach(params["entry"]["uploaded_image"])
    @entry["user_id"] = @current_user["id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end
  
  private

  def set_current_user
    @current_user = current_user
  end
end
