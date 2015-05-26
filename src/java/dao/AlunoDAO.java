package dao;

import java.sql.SQLException;
import java.util.List;
import model.Aluno;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 * Esta Classe é responsável por complementar a classe Aluno.java fazendo a /**
 * manipulação do BD. Aqui entrarão todos os métodos referentes à acesso ao /**
 * Banco de Dados /** DAO - Data Access Object
 */
public class AlunoDAO {

    //Método que faz a leitura da tabela ALUNO e retorna um array (de objetos) contendo cada registro 
    public static List<Aluno> obterAlunos() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Aluno> alunos = session.createCriteria(Aluno.class).list();
        return alunos;
    }

    public static Aluno obterAluno(int idAluno) throws ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        Aluno aluno = (Aluno) session.createQuery("from Aluno where idAluno = "+ idAluno).list().get(0);
        return aluno;
    }

    public static List<Aluno> obterAlunosPorNome(String nome) throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Aluno> alunos = session.createQuery("from Aluno where nome like '%" + nome + "%'").list();
        return alunos;
    }

    public static void gravar(Aluno aluno) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.save(aluno);
        transaction.commit();
        //session.close();
    }

    

    public static void excluir(Aluno aluno) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.delete(aluno);
        transaction.commit();
      //  session.close();
    }

    public static void editar(Aluno aluno) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.update(aluno);
        transaction.commit();
        session.close();
    }
}
