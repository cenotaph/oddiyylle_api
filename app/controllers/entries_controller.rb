class EntriesController < ApplicationController

  def create
    @entry = Entry.where(cookie: params[:cookie]).first_or_initialize
    if @entry.new_record?
      @entry = Entry.new(entry_params)
      if @entry.save
        render json: EntrySerializer.new(@entry).serializable_hash.to_json, status: :created
      else
        respond_with_errors(@entry)
      end
    else
      if @entry.update(entry_params)
        render json: EntrySerializer.new(@entry).serializable_hash.to_json, status: :ok
      else
        respond_with_errors(@entry)
      end
    end
  end

  def index
    @entries = Entry.all
    render json: EntrySerializer.new(@entries).serializable_hash.to_json, status: :ok
  end

  def csv
    require 'csv'
    send_data Entry.to_csv, filename: "entries-#{Date.today}.csv" 
  end
  

  def show
    @entry = Entry.find_by(cookie: params[:id])
    Rails.logger.error @entry.inspect
    if @entry
      
      render json: EntrySerializer.new(@entry).serializable_hash.to_json, status: :ok
    end
  end
  
  def update
    @entry = Entry.where(cookie: params[:cookie]).first_or_initialize
    if @entry

      if [params["yword"], params["homestory"], params["ysound"]].include?("_destroy")
        if params[:yword] == "_destroy"
          @entry.yword.purge       
        end
        if params[:ysound] == "_destroy"
          @entry.ysound.purge       
        end
        if params[:homestory] == "_destroy"
          @entry.homestory.purge       
        end
        render json: EntrySerializer.new(@entry).serializable_hash.to_json, status: :ok
      else
        if @entry.update(entry_params)
          # @entry.ysound.attach(params[:ysound]) unless params[:ysound] == "_destroy"
          # @entry.yword.attach(params[:yword]) unless params[:yword] == "_destroy"
          # @entry.homestory.attach(params[:homestory]) unless params[:homestory] == "_destroy"
          render json: EntrySerializer.new(@entry).serializable_hash.to_json, status: :ok
        else

          respond_with_errors(@entry)
        end
      end
    end
  end
  
  protected

  def entry_params
    params.permit(:id, :name, :email, :municipality, :contact_details, :anonymous, :comments, :cookie, :submitted, :yword, :ysound, :homestory)
  end
  

end
