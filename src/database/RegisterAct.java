package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterAct {
	public static boolean check_user(String name){
		boolean val=true;
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement ps = connection.prepareStatement("select count(*) from users where username=?");
			ps.setString(1,name);			
			ResultSet rs=ps.executeQuery();
			rs.next();
			if(rs.getInt(1)!=0){
				val=false;
			}
			
			}catch(Exception e){System.out.println(e); val = false;}
		finally{closeConnection(connection);}
		return val;
	}
	
	public static int add_user(String username, String password, String name, String email){
		int val;
		Connection connection=null;
		
		try{
			connection=getConnection();
			connection.setAutoCommit(false);
			PreparedStatement ps = connection.prepareStatement("insert into users (username, password, name, email) values (?,?,?,?)");
			ps.setString(1,username);
			ps.setString(2,password);
			ps.setString(3, name);
			ps.setString(4, email);
			ps.executeUpdate();
			connection.commit();
			val = 0;
			}
		catch(Exception e){System.out.println("asdf");System.out.println(e); val = 1;}
		finally{closeConnection(connection);}
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
