import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UserSession{
    public static void createSession(HttpServletRequest request, String username, String password, String usertype){
        HttpSession session = request.getSession(true);
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setAttribute("usertype", usertype);
    }

    public static boolean isLoggedIn(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("username") != null;
    }

    public static String getUsername(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session != null){
            return (String) session.getAttribute("username");
        }
        return null;
    }

    public static String getPassword(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session != null){
            return (String) session.getAttribute("password");
        }
        return null;
    }

    public static String getUsertype(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session != null){
            return (String) session.getAttribute("usertype");
        }
        return null;
    }

    public static void invalidateSession(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session != null){
            session.invalidate();
        }
    }
}
