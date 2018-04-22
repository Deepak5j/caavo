package caavo.src;

import java.io.IOException;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnect.Connector;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int flag = 0;
	private Connection con = null;
	private PreparedStatement psChk, psSngup = null;
	private ResultSet rs = null;	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("uid"); //uid is input field name GETing from Script		
		try {
			con = Connector.createConnection();
			String s = "select * from login where id=?";

			psChk = con.prepareStatement(s);
			psChk.setString(1, id);
			rs = psChk.executeQuery(); //return data(rows)
			
			if(rs.next()) {
				flag = 1;	
				response.setContentType("text/plain");
				response.getWriter().write("User Id already exists, try other User Id.");
			}
			else {
				flag = 0;	
			}
			System.out.println("##"+flag);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(flag == 1) {
			String mess = "Form resets, Don't ignore warning next time!";
			System.out.println("4444");
			//response.sendRedirect("/caavo/jsp/signup.jsp?m="+mess);
			response.sendRedirect("/caavo/jsp/signup.jsp?m=" + URLEncoder.encode(mess, "UTF-8"));						
		} else {
			String id = request.getParameter("uid");
			String pass = request.getParameter("upass");
			
			try {
				con = Connector.createConnection();
				con.setAutoCommit(false);
				String s = "insert into login values(?,?)";
				psSngup = con.prepareStatement(s);
				psSngup.setString(1, id);
				psSngup.setString(2, pass);
				int row = psSngup.executeUpdate(); //return confirmation 1 or 0
				if(row>0) {
					con.setAutoCommit(true);
					response.sendRedirect("/caavo/jsp/signin.jsp");
				}
				
			} catch (SQLException e) {
				System.out.println(e);
			} finally {
				try{
					if(psChk != null)
						psChk.close();
					if(psSngup != null)
						psSngup.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
