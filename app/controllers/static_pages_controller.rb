class StaticPagesController < ApplicationController
	def home
		@blogs = Blog.find(:all, :order => "id DESC").select { |b| b.internal == true}.first(2)
		@workout = Workout.select{ |w| w.date >= Time.now}.first()
		@documents = Document.all
	end

end