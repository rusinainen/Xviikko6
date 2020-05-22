package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Asiakas;
import model.dao.Dao;

@WebServlet("/lisaaasiakas")
public class LisaaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;
          
    public LisaaAsiakas() {
        super(); 
        System.out.println("LisaaAsiakas.LisaaAsiakas()");
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LisaaAsiakas.doGet()");		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LisaaAsiakas.doPost()");
		Asiakas asiakas = new Asiakas();
		asiakas.setEtunimi(request.getParameter("etunimi"));
		asiakas.setSukunimi(request.getParameter("sukunimi"));
		asiakas.setPuhelin(request.getParameter("puhelin"));
		asiakas.setSposti(request.getParameter("sposti"));
		Dao dao = new Dao();
		dao.lisaaAsiakas(asiakas);
		response.sendRedirect("haeasiakkaat?hakusana=" + asiakas.getEtunimi());
	}

}
