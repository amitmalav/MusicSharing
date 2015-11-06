package database;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HomepageAct {
	public static List<String> getMySongs(String user){  
		Connection connection=null;
		List<String> songs = new ArrayList<String>();
		
		try{
		connection=getConnection();
		PreparedStatement ps = connection.prepareStatement("select trackname from track where username=?");  
		ps.setString(1,user);  
		
		ResultSet rs=ps.executeQuery();  
		while(rs.next()){
			songs.add(rs.getString(1));
		}
		}catch(Exception e){//System.out.println(e);
			}  
		return songs;
	}
	public static int check_artist(String artistname){
		int val=0;
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement ps = connection.prepareStatement("select count(*) from artist where artistname=?");
			ps.setString(1,artistname);			
			ResultSet rs=ps.executeQuery();
			rs.next();
			if(rs.getInt(1)!=0){
				val=2;
			}
			
			}catch(Exception e){System.out.println(e); val = 1;}
		finally{closeConnection(connection);}
		return val;
	}

	public static int check_album(String albumname, String artistname){
		int val=0;
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement ps = connection.prepareStatement("select count(*) from artist where albumname=? and artistname=? ");
			ps.setString(1,albumname);
			ps.setString(2,artistname);
			ResultSet rs=ps.executeQuery();
			rs.next();
			if(rs.getInt(1)!=0){
				val=2;
			}
			
			}catch(Exception e){System.out.println(e); val = 1;}
		finally{closeConnection(connection);}
		return val;
	}
	public static int add_artist(String artistname){
		int val;
		Connection connection=null;
		
		try{
			connection=getConnection();
			connection.setAutoCommit(false);
			PreparedStatement ps = connection.prepareStatement("insert into artist (artistname) values (?)");
			ps.setString(1,artistname);
			ps.executeUpdate();
			connection.commit();
			val = 0;
			}
		catch(Exception e){System.out.println("asdf");System.out.println(e); val = 1;}
		finally{closeConnection(connection);}
		return val;
	}
	public static int add_album(String albumname, String artistname){
		int val;
		Connection connection=null;
		
		try{
			connection=getConnection();
			connection.setAutoCommit(false);
			PreparedStatement ps = connection.prepareStatement("insert into album (albumname, artistname) values (?,?)");
			ps.setString(1,albumname);
			ps.setString(2,artistname);
			ps.executeUpdate();
			connection.commit();
			val = 0;
			}
		catch(Exception e){System.out.println("asdf");System.out.println(e); val = 1;}
		finally{closeConnection(connection);}
		return val;
	}
	
	public static int addSong_helper(String username, String albumname, String artistname, String trackname, int playtime, int rating, String link){
		int val;
		Connection connection=null;
		
		try{
			connection=getConnection();
			connection.setAutoCommit(false);
			PreparedStatement ps = connection.prepareStatement("insert into track (username, albumname, artistname, trackname, playtime, trackrating, tracklink) values (?,?,?,?,?,?,?)");
			ps.setString(1,username);
			ps.setString(2,albumname);
			ps.setString(3, artistname);
			ps.setString(4, trackname);
			ps.setInt(5, playtime);
			ps.setInt(6, rating);
			ps.setString(7, link);
			ps.executeUpdate();
			connection.commit();
			val = 0;
			}
		catch(Exception e){System.out.println("asdf");System.out.println(e); val = 1;}
		finally{closeConnection(connection);}
		return val;
	}
	
	public static int addSong(String username, String albumname, String artistname, String trackname, int playtime, int rating, String link){
		int val;
		int valart = check_artist(artistname);
		int valalb = check_album(albumname, artistname);
		if(valart == 1 || valalb == 1){
			return 1;
		}
		if(valart == 0){
			if(add_artist(artistname) == 1)return 1;
		}
		if(valalb == 0){
			if(add_album(albumname, artistname) == 1)return 1;
		}
		val = addSong_helper(username, albumname, artistname, trackname, playtime, rating, link);
		return val;
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
