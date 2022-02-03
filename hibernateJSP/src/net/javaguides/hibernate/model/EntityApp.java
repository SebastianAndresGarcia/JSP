package net.javaguides.hibernate.model;
import javax.persistence.*;

@MappedSuperclass //clase padre de las entidades
@Inheritance(strategy = InheritanceType.JOINED)
public class EntityApp {

    private int id;

    public EntityApp() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
