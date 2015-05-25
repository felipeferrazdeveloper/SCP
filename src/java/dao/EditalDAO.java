package dao;

import java.sql.SQLException;
import java.util.List;
import model.Edital;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 * Esta Classe é responsável por complementar a classe Edital.java fazendo a /**
 * manipulação do BD. Aqui entrarão todos os métodos referentes à acesso ao /**
 * Banco de Dados /** DAO - Data Access Object detalhes do funcionamento dos
 * comandos na classe AlunoDAO.java
 */
public class EditalDAO {

    //Método que faz a leitura da tabela CURSO e retorna um array (de objetos) contendo cada registro 
    public static List<Edital> obterEditais() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Edital> editais = session.createCriteria(Edital.class).list();
        return editais;
    }

    public static Edital obterEdital(int idEdital) throws ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        Edital edital = (Edital) session.createQuery("from Edital where idEdital = "+idEdital).list().get(0);
        return edital;
    }

    
    public static void gravar(Edital edital) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.save(edital);
        transaction.commit();
    }

    public static void excluir(Edital edital) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.delete(edital);
        transaction.commit();
    }

    public static void editar(Edital edital) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.update(edital);
        transaction.commit();
    }

}