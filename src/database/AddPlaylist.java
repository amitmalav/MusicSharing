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
 * Servlet implementation class AddPlaylist
 */
@WebServlet("/AddPlaylist")
public class AddPlaylist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPlaylist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
		HttpSession session = request.getSession(true);
		String user = (String)session.getAttribute("currentuser");
		
		String plname = request.getParameter("plname");
		String ispublic = request.getParameter("secure");
		String[] tracks = request.getParameterValues("track");
		
		if(tracks.length <= 0){
			session.setAttribute("playlistdata", "Invalid");
			response.sendRedirect("newplaylist.jsp");
		}		
		else{
			if(HomepageAct.addPlaylist(user, tracks, plname, ispublic) == 0){
				session.setAttribute("datavalid", "Valid");
				response.sendRedirect("myplaylist.jsp");
	    	}
	    	else{
	    		out.println("Sorry! there was some error during creating the playlist Please try again.");
		    	response.sendRedirect("newplaylist.jsp");
	    	}
		}
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
		HttpSession session = request.getSession(true);
		String user = (String)session.getAttribute("currentuser");
		
		String plname = request.getParameter("plname");
		String ispublic = request.getParameter("secure");
		String[] tracks = request.getParameterValues("track");
		
		if(tracks.length <= 0){
			session.setAttribute("playlistdata", "Invalid");
			response.sendRedirect("newplaylist.jsp");
		}		

		if(ispublic == ""){
			session.setAttribute("playlistdata", "checkradio");
			response.sendRedirect("newplaylist.jsp");
		}
		else{
			if(HomepageAct.addPlaylist(user, tracks, plname, ispublic) == 0){
				session.setAttribute("datavalid", "Valid");
				response.sendRedirect("myplaylist.jsp");
	    	}
	    	else{
	    		out.println("Sorry! there was some error during creating the playlist Please try again.");
		    	response.sendRedirect("newplaylist.jsp");
	    	}
		}
	}

}
