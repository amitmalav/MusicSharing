package database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    
	    String uname = request.getParameter("username");
	    String passwd = request.getParameter("password");
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    
	    if(!RegisterAct.check_user(uname)){
	    	out.println("Sorry! this username is already taken.");
	    	response.sendRedirect("register.jsp");
	    }
	    else{
	    	if(RegisterAct.add_user(uname, passwd, name, email)==0){
	    		response.sendRedirect("login.jsp");
	    	}
	    	else{
	    		out.println("Sorry! there was some error during registration Please try again.");
		    	response.sendRedirect("register.jsp");
	    	}
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
