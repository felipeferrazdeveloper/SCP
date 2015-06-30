package dao;

import java.sql.SQLException;
import java.util.List;
import model.Curso;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
/** Esta Classe é responsável por complementar a classe Curso.java fazendo a 
/** manipulação do BD. Aqui entrarão todos os métodos referentes à acesso ao 
/** Banco de Dados
/** DAO - Data Access Object
* detalhes do funcionamento dos comandos na classe AlunoDAO.java
*/
public class CursoDAO{   
    
    //Método que faz a leitura da tabela CURSO e retorna um array (de objetos) contendo cada registro 
    public static List<Curso> obterCursos()
        throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Curso> cursos = session.createCriteria(Curso.class).list();
        return cursos;
    }
    public static Curso obterCurso(int idCurso) throws ClassNotFoundException{
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        Curso curso = (Curso) session.createQuery("from Curso where idCurso = "+ idCurso).list().get(0);
        session.close();
        return curso;
    }
    
    public static List<Curso> obterCursosPorNome(String nome) throws ClassNotFoundException, SQLException{
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Curso> cursos = session.createQuery("from Curso where nome like '%"+nome+"%'").list();
        return cursos;
    }
    
    public static void gravar(Curso curso) throws SQLException, ClassNotFoundException{
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.save(curso);
        transaction.commit();
    }
    
    public static void excluir(Curso curso) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.delete(curso);
        transaction.commit();
    }
    
    public static void editar(Curso curso) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.update(curso);
        transaction.commit();
    }
}
