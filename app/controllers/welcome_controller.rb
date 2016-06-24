class WelcomeController < ApplicationController
  skip_before_action :ensure_login, only: [:index]

  def index
  end
end
