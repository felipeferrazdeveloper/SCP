package model;
// Generated 14/05/2015 12:02:46 by Hibernate Tools 4.3.1


import dao.AreaDAO;
import java.sql.SQLException;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Area generated by hbm2java
 */
@Entity
@Table(name = "area", catalog = "scp"
)
public class Area implements java.io.Serializable {

    private int idArea;
    private String nome;

    public Area() {
    }

    public Area(int idArea, String nome) {
        this.idArea = idArea;
        this.nome = nome;
    }

    @Id

    @Column(name = "idArea", unique = true, nullable = false)
    public int getIdArea() {
        return this.idArea;
    }

    public void setIdArea(int idArea) {
        this.idArea = idArea;
    }

    @Column(name = "nome", nullable = false, length = 45)
    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public static List<Area> obterAreas() throws ClassNotFoundException, SQLException {
        return AreaDAO.obterAreas();
    }

    public static Area obterArea(int idArea) throws ClassNotFoundException, SQLException {
        return AreaDAO.obterArea(idArea);
    }

    public static List<Area> obterAreaProNome(String nome) throws ClassNotFoundException,
            SQLException {
        return AreaDAO.obterAreasPorNome(nome);
    }

    public void gravar() throws SQLException, ClassNotFoundException {
        AreaDAO.gravar(this);
    }

    public void editar() throws SQLException, ClassNotFoundException {
        AreaDAO.editar(this);
    }

    public void excluir() throws SQLException, ClassNotFoundException {
        AreaDAO.excluir(this);
    }

}
