package database;

import java.util.ArrayList;
import java.util.List;

public class Album {
	String albumname;
	String artist;
	String genre;
	double rating;
	List<Track> songs = new ArrayList<Track>();
	public Album(String a, String ar, String g, double r, List<Track> s){  //always add all fields while instantiation
		albumname = a;
		artist = ar;
		genre = g;
		rating = r;
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
	
	public String getAlbumname(){
		return albumname;
	}
	
	public void setAlbumname(String a){
		albumname = a;
	}
	
	public String getArtist(String ar){
		return artist;
	}
	
	public void setArtist(String a){
		artist = a;
	}
	public String getGenre(){
		return genre;
	}
	
	public void setGenre(String g){
		genre = g;
	}
	public double getRating(){
		return rating;
	}
	public void setRating(double r){
		rating = r;
	}
	
	
	
	
	
}
