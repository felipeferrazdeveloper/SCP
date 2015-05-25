package dao;

import java.sql.SQLException;
import java.util.List;
import model.Projeto;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 * Esta Classe é responsável por complementar a classe Projeto.java fazendo a
 * /** manipulação do BD. Aqui entrarão todos os métodos referentes à acesso ao
 * /** Banco de Dados /** DAO - Data Access Object
 */
public class ProjetoDAO {

    //Método que faz a leitura da tabela PROJETO e instancia cada registro em uma posiçao de uma Array Projeto
    public static List<Projeto> obterProjetos() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Projeto> projetos = session.createCriteria(Projeto.class).list();
        return projetos;
    }

    public static Projeto obterProjeto(int idProjeto) throws ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        Projeto projeto = (Projeto) session.createQuery("from Projeto where idProjeto = "+idProjeto).list().get(0);
        return projeto;
    }

    public static List<Projeto> obterProjetosPorNome(String nome) throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.clear();
        List<Projeto> projetos = session.createQuery("from Projeto where nome like '%" + nome + "%'").list();
        return projetos;
    }

    public static void gravar(Projeto projeto) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.clear();
        Transaction transaction = session.beginTransaction();
        session.save(projeto);
        transaction.commit();
    }

    public static void excluir(Projeto projeto) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.clear();
        Transaction transaction = session.beginTransaction();
        session.delete(projeto);
        transaction.commit();
    }

    public static void editar(Projeto projeto) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.clear();
        Transaction transaction = session.beginTransaction();
        session.update(projeto);
        transaction.commit();
    }
}
