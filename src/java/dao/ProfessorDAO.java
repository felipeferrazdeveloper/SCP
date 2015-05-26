package dao;

import java.sql.SQLException;
import java.util.List;
import model.Professor;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 * Esta Classe é responsável por complementar a classe Professor.java fazendo a
 * /** manipulação do BD. Aqui entrarão todos os métodos referentes à acesso ao
 * /** Banco de Dados /** DAO - Data Access Object detalhes do funcionamento dos
 * comandos na classe AlunoDAO.java
 */
public class ProfessorDAO {

    //Método que faz a leitura da tabela PROFESSOR e retorna um array (de objetos) contendo cada registro 
    public static List<Professor> obterProfessores() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Professor> professores = session.createCriteria(Professor.class).list();
        return professores;
    }

    public static Professor obterProfessor(int idProfessor) throws ClassNotFoundException{
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        Professor professor = (Professor) session.createQuery("from Professor where idProfessor = "+idProfessor).list().get(0);
        return professor;
    }

    public static List<Professor> obterProfessoresPorNome(String nome) throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.clear();
        List<Professor> professores = session.createQuery("from Professor where nome like '%" + nome + "%'").list();
        return professores;
    }

    public static void gravar(Professor professor) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.save(professor);
        transaction.commit();
    }

    public static void excluir(Professor professor) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.delete(professor);
        transaction.commit();
    }

    public static void editar(Professor professor) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.update(professor);
        transaction.commit();
    }
}
