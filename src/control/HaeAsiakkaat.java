package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Asiakas;
import model.dao.Dao;

@WebServlet("/haeasiakkaat")
public class HaeAsiakkaat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public HaeAsiakkaat() {
        super();
        System.out.println("HaeAsiakkaat.HaeAsiakkaat()");
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HaeAsiakkaat.doGet()");
		String hakusana = request.getParameter("hakusana");			
		Dao dao = new Dao();			
		try {
			ArrayList<Asiakas> asiakkaat = dao.listaaKaikki(hakusana);
			System.out.println(asiakkaat);			
			request.setAttribute("asiakkaat", asiakkaat);			
			String jsp = "/listaaasiakkaat.jsp"; 
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
			dispatcher.forward(request, response);			   
		} catch (Exception e) {				
			e.printStackTrace();
		}					
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HaeAsiakkaat.doPost()");
	}

}
