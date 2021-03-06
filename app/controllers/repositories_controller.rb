require 'pry'

class RepositoriesController < ApplicationController
  def index
    github = GithubService.new({"access_token" => session[:token]})
    @repos_array = github.get_repos
  end

  def create
    github = GithubService.new({"access_token" => session[:token]})
    response = github.create_repo(params[:name])
    redirect_to '/'
  end
end
