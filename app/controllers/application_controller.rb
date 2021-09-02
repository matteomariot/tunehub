class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :bands
  before_action :search_bands
  before_action :search_songs
  before_action :search_partitions

  def bands
    @user_bands = Band.joins(:members).where(members: { user_id: current_user })
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :photo])
  end

  def search_bands
    if params[:controller] == "bands" && params[:action] == "index"
      if params[:query].present?
        sql_query = " \
          bands.name ILIKE :query \
        "
        @search_user_bands = Band.joins(:members).where(sql_query, query: "%#{params[:query]}%").distinct
      else
        @search_user_bands = Band.joins(:members).where(members: { user_id: current_user })
      end
    end
  end

  def search_songs
    if params[:controller] == "bands" && params[:action] == "show"
      if params[:query].present?
        sql_query = " \
          songs.name ILIKE :query \
        "
        @search_songs = Song.where(sql_query, query: "%#{params[:query]}%").where(band_id: params[:id])
      else
        @search_songs_band = Band.find(params[:id])
        @search_songs = Song.where(band_id: Band.find(params[:id]).id)
      end
    end
  end

  def search_partitions
    if params[:controller] == "songs" && params[:action] == "show"
      if params[:query].present?
        sql_query = " \
          partitions.title ILIKE :query \
        "
        @search_partitions = Partition.where(sql_query, query: "%#{params[:query]}%").where(song_id: params[:id])
        @search_band = Band.find(params[:band_id])
        @search_songs = Song.where(sql_query, query: "%#{params[:query]}%").where(band_id: params[:id])
      else
        @search_partitions = Partition.where(song_id: Song.find(params[:id]).id)
        @search_song = Song.find(params[:id])
        @search_band = Band.find(params[:band_id])
      end
    end
  end
end
