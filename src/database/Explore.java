package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Explore {
	public static List<String> getartist(){  
		Connection connection=null;
		List<String> artist = new ArrayList<String>();
		try{
		connection=getConnection();
		PreparedStatement ps = connection.prepareStatement("select artistname from artist");
		ResultSet rs=ps.executeQuery();  
		while(rs.next()){
			artist.add(rs.getString(1));
		}
		}catch(Exception e){System.out.println(e);
		}
	finally{
		closeConnection(connection);
	}
	return artist;

}
	public static List<String> getuser(){  
		Connection connection=null;
		List<String> user = new ArrayList<String>();
		try{
		connection=getConnection();
		PreparedStatement ps = connection.prepareStatement("select username from users");
		ResultSet rs=ps.executeQuery();  
		while(rs.next()){
			user.add(rs.getString(1));
		}
		}catch(Exception e){System.out.println(e);
		}
	finally{
		closeConnection(connection);
	}
	return user;

}
	public static List<String> getalbum(){  
		Connection connection=null;
		List<String> album = new ArrayList<String>();
		try{
		connection=getConnection();
		PreparedStatement ps = connection.prepareStatement("select albumname from album");
		ResultSet rs=ps.executeQuery();  
		while(rs.next()){
			album.add(rs.getString(1));
		}
		}catch(Exception e){System.out.println(e);
		}
	finally{
		closeConnection(connection);
	}
	return album;

}
	public static List<Track> getTrack(String artist, String user, String album){  
		Connection connection=null;
		List<Track> songs = new ArrayList<Track>();
		try{
		connection=getConnection();
		boolean ar = false, u = false, al = false;
		if(!artist.equals("All")) ar = true;
		if(!user.equals("All")) u = true;
		if(!album.equals("All")) al = true;
		if(ar && u && al){
			PreparedStatement ps = connection.prepareStatement("select * from track");
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){
				Track t = new Track(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),  rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				songs.add(t);
			}
		}
		else if(ar && u && !al){
			PreparedStatement ps = connection.prepareStatement("select * from track where albumname = ?");
			ps.setString(1,album);
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){
				Track t = new Track(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),  rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				songs.add(t);
			}
		}
		else if(ar && !u && !al){
			PreparedStatement ps = connection.prepareStatement("select * from track where albumname = ? and username=?");
			ps.setString(1,album);
			ps.setString(2,user);
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){
				Track t = new Track(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),  rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				songs.add(t);
			}
		}
		else if(!ar && !u && !al){
			PreparedStatement ps = connection.prepareStatement("select * from track where albumname = ? and username=? and artistname=?");
			ps.setString(1,album);
			ps.setString(2,user);
			ps.setString(3,artist);
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){
				Track t = new Track(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),  rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				songs.add(t);
			}
		}
		else if(ar && !u && al){
			PreparedStatement ps = connection.prepareStatement("select * from track where username=?");
			
			ps.setString(1,user);
			
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){
				Track t = new Track(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),  rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				songs.add(t);
			}
		}
		else if(!ar && u && al){
PreparedStatement ps = connection.prepareStatement("select * from track where artistname=?");
			
			ps.setString(1,artist);
			
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){
				Track t = new Track(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),  rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				songs.add(t);
			}
		}
		else if(!ar && u && !al){
			PreparedStatement ps = connection.prepareStatement("select * from track where albumname = ? and artistname=?");
			ps.setString(1,album);
			
			ps.setString(2,artist);
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){
				Track t = new Track(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),  rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				songs.add(t);
			}
		}
		else if(!ar && !u && al){
			PreparedStatement ps = connection.prepareStatement("select * from track where artistname=? and username=?");
			ps.setString(1,artist);
			
			ps.setString(2,user);
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){
				Track t = new Track(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),  rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				songs.add(t);
			}
		}
		else{
			
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
