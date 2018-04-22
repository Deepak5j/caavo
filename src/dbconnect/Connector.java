package dbconnect;

import java.sql.Connection; // for con
import java.sql.DriverManager;
import java.sql.PreparedStatement; // for ps
import java.sql.ResultSet; // for rs
import java.sql.SQLException; //for SQLException
import java.util.ResourceBundle; // for rb

import com.mysql.jdbc.Driver;

public class Connector {
	private static Connection con = null;
	private static ResultSet rs = null;
	private static PreparedStatement ps = null;
	private static ResourceBundle rb 
		= ResourceBundle.getBundle("propertyfile.config"); //propertyfile Package and config file
	
	//create connection method
	public static Connection createConnection() {
		try {
			Class.forName(rb.getString("driver")); //driver name from propertyfile, load sql driver
			con = DriverManager.getConnection(rb.getString("url"), rb.getString("user"), rb.getString("pass"));
		} catch(ClassNotFoundException|SQLException e) {
			System.out.println(e);
		}
		return con;
	}
	//for String Data
	public static ResultSet getData(String sql, String data) {
		con = createConnection(); //calling above method to create connection
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, data);
			rs = ps.executeQuery();
		} catch(SQLException e) {
			System.out.println(e);
		}
		return rs;
	}
	//for no data
	public static ResultSet getData(String sql) {
		con = createConnection();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return rs;
	}
	//for int data
	public static ResultSet getData(String sql, int data) {
		con = createConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, data);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return rs;
	}
}





