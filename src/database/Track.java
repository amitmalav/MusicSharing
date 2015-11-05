package database;

public class Track {
	String name;
	String link;
	double ptime;
	String album;
	String user;
	double rating;
	boolean appr;
	
	public Track(String n, String l, double pt, String a, String u, double r, boolean app){
		name = n;
		link = l;
		ptime = pt;
		album = a;
		user = u;
		rating = r;
		appr = app;
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
	public double getPlayTime(){
		return ptime;
	}
	public void setPlatTime(double t){
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
	public double getRating(){
		return rating;
	}
	public void setRating(double r){
		rating = r;
	}
	public boolean getStatus(){
		return appr;
	}
	public void setStatus(boolean b){
		appr = b;
	}
}
