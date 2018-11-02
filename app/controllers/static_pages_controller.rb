class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[about]

  def about
    @space = policy_scope(Space)
  end
end
