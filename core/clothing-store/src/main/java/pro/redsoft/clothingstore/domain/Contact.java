package pro.redsoft.clothingstore.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Entity
@Table(name = "Contact")
public class Contact implements Serializable {

    private Integer id;
    private String name;
    private Address address;
    private Phone phone;

    @Id
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}
