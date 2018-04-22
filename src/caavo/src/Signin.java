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
import javax.servlet.http.HttpSession;

import dbconnect.Connector;

/**
 * Servlet implementation class Signin
 */
@WebServlet("/Signin")
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private int flag = 0;
	private Connection con = null;
	private PreparedStatement psChk, psSngin = null;
	private ResultSet rs = null;	   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signin() {
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
			
			if(!rs.next()) {
				flag = 1;	
				response.setContentType("text/plain");
				response.getWriter().write("User Id not exists!"); //setting message on jsp
			}
			else {
				flag = 0;	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(flag == 1) {
			String mess = "Wrong user Id or password!";
			//response.sendRedirect("/caavo/jsp/signup.jsp?m="+mess);
			response.sendRedirect("/caavo/jsp/signin.jsp?m=" + URLEncoder.encode(mess, "UTF-8"));						
		} else {			
			String id = request.getParameter("uid");
			String pass = request.getParameter("upass");
			
			try {
				con = Connector.createConnection();
				String s="select * from login where id=? and pass=?";//table column
				psSngin = con.prepareStatement(s);
				psSngin.setString(1, id);
				psSngin.setString(2, pass);
				rs=psSngin.executeQuery();
				
				if(rs.next()) {
					HttpSession hs=request.getSession();
					hs.setAttribute("sessid",id);  //binding id to session					
					response.sendRedirect("/caavo/jsp/main.jsp");
				} else {
					String mess = "Wrong password!";
					response.sendRedirect("/caavo/jsp/signin.jsp?m=" + URLEncoder.encode(mess, "UTF-8"));
				}
				
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				try{
					if(psChk != null)
						psChk.close();
					if(psSngin != null)
						psSngin.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
