package database;

public class Track {
	String trackid;
	String name;
	String link;
	int ptime;
	String album;
	String user;
	float rating;
	String appr;
	String artist;
	public Track(String id,  String u, String a, String ar, String n,  int pt,  float r, String app, String l ){
		trackid = id;
		name = n;
		link = l;
		ptime = pt;
		album = a;
		user = u;
		rating = r;
		appr = app;
		artist = ar;
	}
	public String getTrackid(){
		return trackid;
	}
	public String getTrack(){
		return name;
	}
	public void setTrack(String t){
		name = t;
	}
	public String getLink(){
		return link;
	}
	public void setLink(String t){
		link = t;
	}
	public int getPlayTime(){
		return ptime;
	}
	public void setPlayTime(int t){
		ptime = t;
	}
	public String getAlbum(){
		return album;
	}
	public void setAlbum(String t){
		album = t;
	}
	public String getUser(){
		return user;
	}
	public float getRating(){
		return rating;
	}
	public void setRating(float r){
		rating = r;
	}
	public String getStatus(){
		return appr;
	}
	public void setStatus(String b){
		appr = b;
	}
	public String getArtist(){
		return artist;
	}
}
