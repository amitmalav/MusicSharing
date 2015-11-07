package database;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddSong
 */
@WebServlet("/AddSong")
public class AddSong extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSong() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		/* response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	    
	    
		HttpSession session = request.getSession(true);
		String username = (String)session.getAttribute("currentuser");
		String albumname = request.getParameter("albumname");
		String artistname = request.getParameter("artistname");
		String trackname = request.getParameter("trackname");
		String playtime = request.getParameter("playtime");
		String rating = request.getParameter("rating");
		String link = request.getParameter("link");
		if(albumname == "" || artistname == "" || trackname == "" || playtime == "" || rating == "" || link == ""){
			session.setAttribute("datavalid", "Invalid");
			response.sendRedirect("addsong.jsp");
		}
		else{
			//int playint = Integer.parseInt(playtime);
			//int ratint = Integer.parseInt(rating);
			if(HomepageAct.addSong(username, albumname, artistname, trackname, playtime, rating, link)==0){
				session.setAttribute("datavalid", "Valid");
				response.sendRedirect("home.jsp");
	    	}
	    	else{
	    		out.println("Sorry! there was some error during adding the song Please try again.");
		    	response.sendRedirect("addsong.jsp");
	    	}
		}
		
		
		
		
		//out.print("Welcome "+ username);
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	    
	    
		HttpSession session = request.getSession(true);
		String username = (String)session.getAttribute("currentuser");
		String albumname = request.getParameter("albumname");
		String artistname = request.getParameter("artistname");
		String trackname = request.getParameter("trackname");
		String playtime = request.getParameter("playtime");
		String rating = request.getParameter("trackrating");
		String link = request.getParameter("link");
		if(albumname == "" || artistname == "" || trackname == "" || playtime == "" || rating == "" || link == ""){
			session.setAttribute("datavalid", "Invalid");
			response.sendRedirect("addsong.jsp");
		}
		else{
			//int playint = Integer.parseInt(playtime);
			//int ratint = Integer.parseInt(rating);
			int i=Integer.parseInt(playtime);
			float a=Float.valueOf(rating);
			System.out.println(a);
			System.out.println("fghjk");
			if(HomepageAct.addSong(username, albumname, artistname, trackname, i, a, link)==0){
				session.setAttribute("datavalid", "Valid");
				response.sendRedirect("home.jsp");
	    	}
	    	else{
	    		out.println("Sorry! there was some error during adding the song Please try again.");
		    	response.sendRedirect("addsong.jsp");
	    	}
		}
		
		
		
		
		//out.print("Welcome "+ username);
	}

}
