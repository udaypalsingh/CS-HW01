import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
@WebServlet(name = "Servlet")

public class Servlet{

    public static void main(String args[]){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a","root","RNuv=*SKss1469");
//here cs157a is database name, root is username and password
                    Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from movies");
            while(rs.next())
                System.out.println(rs.getString(1)+" "+rs.getInt(2)+" "+rs.getDouble(3));
            con.close();
        }catch(Exception e){ System.out.println(e);}
    }
}
