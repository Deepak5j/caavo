package caavo.src;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnect.Connector;

/**
 * Servlet implementation class Add
 */
@WebServlet("/Add")
public class Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection con = null;
	private PreparedStatement psac, psdl = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		String id=(String)hs.getAttribute("sessid");
		
		String ano = request.getParameter("ano");
		String nm = request.getParameter("nm");
		String dob = request.getParameter("dob");
		String lno = request.getParameter("lno");
		String vc = request.getParameter("vc");
		
		con = Connector.createConnection();
		
		try {
			
			String sac = "insert into acdata values(?,?,?,?)";
			String sdl = "insert into dldata values(?,?,?,?)";
			
			psac = con.prepareStatement(sac);			
			psdl = con.prepareStatement(sdl);
			
			psac.setString(1, id);
			psac.setInt(2, Integer.parseInt(ano));
			psac.setString(3, nm);
			psac.setString(4, dob);
			
			psdl.setString(1, id);
			psdl.setString(2, lno);
			psdl.setString(3, nm);
			psdl.setString(4, vc);
			
			int rac = psac.executeUpdate(); 
			int rdl = psdl.executeUpdate(); 
			
			if(rac>0 && rdl>0) {
				response.sendRedirect("/caavo/jsp/main.jsp");
			}
		} catch (Exception e) {
			String mess = "Some error occured, try again!";
			//response.sendRedirect("/caavo/jsp/signup.jsp?m="+mess);
			response.sendRedirect("/caavo/jsp/add.jsp?m=" + URLEncoder.encode(mess, "UTF-8"));
			e.printStackTrace();
		}		
	}
}
