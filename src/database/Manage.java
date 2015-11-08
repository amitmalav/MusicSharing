package database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Manage
 */
@WebServlet("/Manage")
public class Manage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Manage() {
        super();
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
		HttpSession session = request.getSession(true);
		String user = (String)session.getAttribute("currentuser");
		String[] tracks = request.getParameterValues("checked");
		
		if(tracks.length <= 0){
			//session.setAttribute("playlistdata", "Invalid");
			response.sendRedirect("home.jsp");
		}
		
			if(HomepageAct.updateTrack(tracks) == 0){
				//if(HomepageAct.disapproveTrack() == 0){
					session.setAttribute("datavalid", "Valid");
					response.sendRedirect("myplaylist.jsp");
				}
				//else{
		    		//out.println("Sorry! there was some error during deleting the playlist Please try again.");
		    		//response.sendRedirect("newplaylist.jsp");
		    	//}
				
	    	//}
	    	else{
	    		out.println("Sorry! there was some error during creating the playlist Please try again.");
		    	response.sendRedirect("newplaylist.jsp");
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
