package database;

import java.util.ArrayList;
import java.util.List;

public class Playlist {
	String pname;
	String user;
	List<Track> songs = new ArrayList<Track>();
	public Playlist(String a, String ar, List<Track> s){  //always add all fields while instantiation
		pname = a;
		user = ar;
		songs = s;
	}
	
	public void addSong(List<Track> song){   //adds songs to album 
		for(Track s: song) songs.add(s);
	}
	public void removeSong(Track tr){
		for(int i=0; i<songs.size(); i++){
			if(songs.get(i).equals(tr)){songs.remove(i); break;}
		}
	}
	
	public String getPlaylistname(){
		return pname;
	}
	
	public void setPlayListname(String a){
		pname = a;
	}
	
	public String getUser(String ar){
		return user;
	}
	
	public void setUser(String a){
		user = a;
	}
	

}
