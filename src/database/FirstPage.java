package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.Track;
public class FirstPage {
	public static List<Track> getTopSongs(){  
	Connection connection=null;
	List<Track> songs = new ArrayList<Track>();
	
	try{
	connection=getConnection();
	PreparedStatement ps = connection.prepareStatement("select * from track order by trackrating desc limit 10");  
	ResultSet rs=ps.executeQuery();  
	while(rs.next()){
		String id = rs.getString(1);
		String user = rs.getString(2);
		String album = rs.getString(3);
		String artist = rs.getString(4);
		String name = rs.getString(5);
		String ptime = rs.getString(6);
		String rating = rs.getString(7);
		String appr = rs.getString(8);
		String link = rs.getString(9);
		Track t = new Track(id, user, album, artist, name, ptime, rating, appr, link);
		songs.add(t);
	}
	}catch(Exception e){System.out.println(e);
		}
	finally{
		closeConnection(connection);
	}
	return songs;
}
static Connection getConnection() {
	String dbURL = "jdbc:postgresql://10.105.1.12/cs387";
    String dbUser = "db130050045";
    String dbPass = "db130050045";
    Connection connection=null;
    try {
		Class.forName("org.postgresql.Driver");
		connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
    } catch(ClassNotFoundException cnfe){
    	System.out.println("JDBC Driver not found");
    } catch(SQLException sqle){
    	System.out.println("Error in getting connetcion from the database");
    }
    
    return connection;
}

static void closeConnection(Connection connection) {
	try{
		connection.close();
	} catch(SQLException sqle) {
		System.out.println("Error in close database connetcion");
	}
}

}
