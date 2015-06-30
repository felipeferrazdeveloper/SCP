package dao;

import java.sql.SQLException;
import java.util.List;
import model.Area;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/** Esta Classe é responsável por complementar a classe Area.java fazendo a 
/** manipulação do BD. Aqui entrarão todos os métodos referentes à acesso ao 
/** Banco de Dados
/** DAO - Data Access Object
* detalhes do funcionamento dos comandos na classe AlunoDAO.java
*/
public class AreaDAO {
    //Método que faz a leitura da tabela SUBAREA e retorna um array (de objetos) contendo cada registro 
    public static List<Area> obterAreas() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Area> areas = session.createCriteria(Area.class).list();
        return areas;
    }
    
    public static Area obterArea(int idArea) throws ClassNotFoundException{
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        Area area = (Area) session.createQuery("FROM Area WHERE idArea = " + idArea).list().get(0);
        session.close();
        return area;
    }
    
   public static List<Area> obterAreasPorNome(String nome) throws ClassNotFoundException, SQLException{
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Area> areas = session.createQuery("from Area where nome like '%"+nome+"%'").list();
        return areas;
    }
    
    public static void gravar(Area area) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.save(area);
        transaction.commit();
    }
    
   public static void excluir(Area area) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.delete(area);
        transaction.commit();
    }
    
    public static void editar(Area area) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.update(area);
        transaction.commit();
    }
    
}
