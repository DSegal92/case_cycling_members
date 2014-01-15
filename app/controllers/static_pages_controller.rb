class StaticPagesController < ApplicationController
	skip_filter :check_session
	def home
		@blogs = Blog.find(:all, :order => "id DESC").select { |b| b.internal == true}.first(2)
		@workout = Workout.select{ |w| w.date >= Time.now}.first()
		@documents = Document.all
		@secretary_email = Member.find_by_id(Position.find_by_title("Secretary").member_id).email
	end

end