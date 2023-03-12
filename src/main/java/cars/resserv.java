package cars;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/resserv")
public class resserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public resserv() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String n=request.getParameter("name");
		String p=request.getParameter("psw");
		String e=request.getParameter("email");
		String a=request.getParameter("address");
		String mn=request.getParameter("mobile");
		
		Bean b1=new Bean();
		b1.setName(n);
		b1.setPassword(p);
		b1.setEmail(e);
		b1.setAddress(a);
		b1.setMobile_no(mn);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/batch12", "root", "");
			PreparedStatement ps = con.prepareStatement("insert into reg1(Name,Password,Email,Address,Mobile_no) values(?,?,?,?,?)");	
			ps.setString(1, n);
			ps.setString(2, p);
			ps.setString(3, e);
			ps.setString(4, a);
			ps.setString(5, mn);
			int k=ps.executeUpdate();
			if(k>0) {
				response.sendRedirect("Login.html");
			}
			else {
				pw.print("Please fill correct info....");
			}

			
		}
		catch(Exception e1) {
			System.out.println(e1);
		}
	}

}
