
import com.phesach.project.Model.Book.BookDAO;
import com.phesach.project.Model.Book.BookDTO;
import com.phesach.project.Model.User.UserDAO;
import com.phesach.project.Model.User.UserDTO;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Radriar
 */
public class Test {

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        List<UserDTO> list = dao.getAllUsers();
        for (UserDTO userDTO : list) {
            System.out.println(userDTO.getEmail());
        }
    }
}
