class PostsController < ApplicationController
	validates :name, presence: true
end