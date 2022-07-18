class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotUnique do |e|
    redirect_to wiki_index_url(anchor: 'wikis'), notice: 'Username already taken.'
  end
end
