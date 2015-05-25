package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/** Esta Classe é responsável por configurar a string de conexão com o Banco e 
/** realizar a conexão com o Banco de Dados 
*/
public class BD {
    
    public static Connection getConexao()
        throws ClassNotFoundException,
               SQLException{
        Connection conexao = null;
        Class.forName("com.mysql.jdbc.Driver");
        conexao = DriverManager.getConnection("jdbc:mysql://localhost/scp", "root", "");
        return conexao;
    }
}
