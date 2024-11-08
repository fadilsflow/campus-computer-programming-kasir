
package kumara;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Koneksi {
    public static Connection Go(){
        try {
            MysqlDataSource m = new MysqlDataSource();
            String url = "jdbc:mysql://localhost:3306/kumara";
            String user = "root";
            String pass = "vipas";
//            MysqlDataSource m = new MysqlDataSource();
//            String url = "jdbc:mysql://localhost:3306/kumara";
//            String user = "root";
//            String pass = "Wahyu0085!";
            
            Connection C = DriverManager.getConnection(url, user, pass);
            System.out.println("Koneksi sukses");
            return C;
        } catch (SQLException e) {
            System.err.println("Koneksi Gagal!\n"+
                    e.getMessage());
        }
        
        
        return null;
    }
}
