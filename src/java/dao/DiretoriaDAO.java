package dao;

import java.sql.SQLException;
import java.util.List;
import model.Diretoria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/** Esta Classe é responsável por complementar a classe Diretoria.java fazendo a 
/** manipulação do BD. Aqui entrarão todos os métodos referentes à acesso ao 
/** Banco de Dados
/** DAO - Data Access Object
* detalhes do funcionamento dos comandos na classe AlunoDAO.java
*/
public class DiretoriaDAO {
    
    //Método que faz a leitura da tabela DIRETORIA e retorna um array (de objetos) contendo cada registro 
    
    public static List<Diretoria> obterDiretorias() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Diretoria> diretorias = session.createCriteria(Diretoria.class).list();
        return diretorias;
    }
    
    public static Diretoria obterDiretoria(int idDiretoria) throws ClassNotFoundException{
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        Diretoria diretoria = (Diretoria) session.createQuery("from Diretoria where idDiretoria = "+idDiretoria).list().get(0);
        return diretoria;
    }    
    
    public static List<Diretoria> obterDiretoriasPorNome(String nome) throws ClassNotFoundException, SQLException{
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Diretoria> diretorias = session.createQuery("from Diretoris where nome like '%"+nome+"%'").list();
        return diretorias;
    }
    
    public static void gravar(Diretoria diretoria) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.save(diretoria);
        transaction.commit();
    }
    
   public static void excluir(Diretoria diretoria) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.delete(diretoria);
        transaction.commit();
    }
    
    public static void editar(Diretoria diretoria) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.update(diretoria);
        transaction.commit();
    }
}
