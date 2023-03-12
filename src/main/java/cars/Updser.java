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


@WebServlet("/Updser")
public class Updser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public Updser() {
		super();
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		String n = request.getParameter("firstname");
		String c = request.getParameter("carname");
		String cl = request.getParameter("color");
		String a = request.getParameter("address");
		String e = request.getParameter("email");
		String p = request.getParameter("pincode");
		String mn = request.getParameter("mobile_no");

		Bean b1 = new Bean();
		b1.setId(id);
		b1.setName(n);
		b1.setCarname(c);
		b1.setColor(cl);
		b1.setAddress(a);
		b1.setEmail(e);
		b1.setPincoad(p);
		b1.setMobile_no(mn);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/batch12", "root", "");
			PreparedStatement ps = con.prepareStatement(
					"update car set Name=?, Car_Name=?, Color=?,Email=?,Address=?,Pin_code=?,Mobile_No=? where ID=?");
			ps.setString(1, n);
			ps.setString(2, c);
			ps.setString(3, cl);
			ps.setString(4, e);
			ps.setString(5, a);
			ps.setString(7, mn);
			ps.setString(6, p);
			ps.setInt(8, id);

			int k = ps.executeUpdate();
			if (k > 0) {
				response.sendRedirect("show1.jsp");
			} else

			{
				pw.print("error....");
			}

		} catch (Exception e2) {
			System.out.println(e2);
		}
	}
}
