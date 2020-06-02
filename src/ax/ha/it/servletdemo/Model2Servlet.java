 
package ax.ha.it.servletdemo;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Model2Servlet
 */
@WebServlet("/Model2/*")
public class Model2Servlet extends HttpServlet {

	private static final long serialVersionUID = 544605969917177395L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public Model2Servlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex+1);
		
		if (action.equals("input_data") || action.equals("")) {
			Person person = new Person("Mister", "Master");
			request.setAttribute("person", person);
			request.getRequestDispatcher("/WEB-INF/views/input.jsp").forward(request,  response);
		}
		if (action.equals("save_data")) {
			Person person = new Person();
			person.setFirstName(request.getParameter("first"));
			person.setLastName(request.getParameter("last"));
			// Actually store the person somewhere...
			request.setAttribute("person", person);
			request.getRequestDispatcher("/WEB-INF/views/confirm.jsp").forward(request,  response);
		}
	}
}
