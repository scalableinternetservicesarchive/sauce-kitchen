class LocationPlaylistsController < ApplicationController
	def show
		playlists = Playlist.all
		playlist_list = playlists.map do |p|
		 	{ :id => p.id, :title => p.title, :lat => p.latitude, :lng => p.longitude}
		end
		@playlists = playlist_list.to_json
	end
end