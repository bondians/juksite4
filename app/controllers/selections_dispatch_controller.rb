class SelectionsDispatchController < ApplicationController
  


#### don't think i'm using any of these, add them back later if they become relewent
#### also move them into selections or just get rid
#    case params[:submit]
#      when "Add to Playlist"
#        Playlist.add_songs_to_playlist(songs, playlist)
#        redirect_to(playlist)
#  
#      when "Tar"
#        
#        files = songs.collect {|s| Song.find(s).file.gsub(/^[\/]/,"")}
#        data = IO.popen("cd / ; /bin/tar cvhfs - \"#{files.join "\" \""}\"" )
#        send_data( data, :filename => 'songs.tar', :type => :tar)
#        redirect_to(playlist)
#        
#      when "Remove from Playlist"
#        Playlist.remove_songs_from_playlist(songs, playlist)
#        redirect_to(playlist)
#        
#      when "Get Streaming List"
#        @songs = Song.find songs, :include => :songtype
#        respond_to do |format|
#          format.m3u {render :template => '/playlists/show'}
#        end
#      
#      when "Set Order"
#        new_index = params[:index]
#        Reqlist.set_index(new_index)
#        redirect_to(selections_url)
#        
#      when "Remove Selected"
#        removals = Reqlist.find_all_by_song_id params[:songs]
#        removals += Randlist.find_all_by_song_id params[:songs]
#        removals.each do |remove|
#          remove.destroy
#        end
#        redirect_to(selections_url)
#    end
#  end
end
