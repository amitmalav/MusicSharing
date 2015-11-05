package database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Login() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	          
	    String username=request.getParameter("username");  
	    String password=request.getParameter("password");  
	          
	    if(LoginAct.validate(username, password)){
	    	//request.setAttribute("username", n);
	    	HttpSession userSession = request.getSession(true);
			//userSession.setAttribute("currentUser", username);
	    	userSession.setAttribute("currentuser", username);
	    	response.sendRedirect("home.jsp");
	    }
	    else{  
	        //out.print("Sorry username or password error");  
	        //RequestDispatcher rd=request.getRequestDispatcher(request.getContextPath() + "/login.jsp");  
	        //rd.include(request,response);
	    	//request.getSession(true).setAttribute("error", "Invalid");
	    	response.sendRedirect("login.jsp");
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
