package pro.redsoft.clothingstore.domain;

import pro.redsoft.clothingstore.domain.order.Orders;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Entity
@Table(name = "contact")
public class Contact implements Serializable {

    private static final long serialVersionUID = -7214090087585999345L;

    private Long id;
    private String name;
    private Address address;
    private Phone phone;
    private Orders orders;

    @Id
    @GeneratedValue
    @Column(name = "id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Embedded
    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Embedded
    public Phone getPhone() {
        return phone;
    }

    public void setPhone(Phone phone) {
        this.phone = phone;
    }

    @OneToOne(fetch = FetchType.EAGER, mappedBy = "contact")
    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }
}