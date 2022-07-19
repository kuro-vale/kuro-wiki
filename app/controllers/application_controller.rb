class ApplicationController < ActionController::Base
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotUnique do |_e|
    redirect_to wiki_index_url(anchor: 'wikis'), notice: t('devise.errors.taken')
  end

  rescue_from NoMethodError do |_e|
    redirect_to wiki_index_url(anchor: 'wikis'), notice: t('devise.errors.login_failed')
  end

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
