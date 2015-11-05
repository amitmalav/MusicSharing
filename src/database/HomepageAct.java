package database;

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
