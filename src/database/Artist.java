package database;

public class Artist {
	String name;
	double rating;
	
	public Artist(String n, double r){
		name = n;
		rating = r;
	}
	public double getRating(){
		return rating;
	}
	public void setRating(double r){
		rating = r;
	}
	
	
	

}
