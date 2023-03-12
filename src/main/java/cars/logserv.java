package cars;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/logserv")
public class logserv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public logserv() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String n=request.getParameter("name");
		String p=request.getParameter("psw");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/batch12", "root", "");
			PreparedStatement ps = con.prepareStatement("select name,password from reg1 where name=? and password=?");	
			ps.setString(1, n);
			ps.setString(2, p);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				if (n.equals(rs.getString(1)) && p.equals(rs.getString(2))) 
				{
				response.sendRedirect("Book.html");
			}

			else {
				pw.print("<h3>error...</h3>");
			}
		}

	} catch (Exception e2) {
		System.out.println(e2);
	}
	}

}
