package pro.redsoft.clothingstore.domain;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import pro.redsoft.clothingstore.domain.order.Orders;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Set;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Entity
@Table(name = "contact")
public class Contact extends DomainObject implements Serializable {

    private static final long serialVersionUID = -7214090087585999345L;

    private Long id;
    private String name;
    private Address address;
    private Set<Phone> phone;
    private String email;
    private String skype;
    private Orders orders;
    private Owner owner;

    @Id
    @GeneratedValue
    @Column(name = "id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "name", nullable = false)
    @Length(max = 8, message = "test")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Embedded
    @NotNull
    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @ElementCollection
    @CollectionTable(
            name = "contact_phones",
            joinColumns = @JoinColumn(name = "contact_id")
    )
    public Set<Phone> getPhone() {
        return phone;
    }

    public void setPhone(Set<Phone> phone) {
        this.phone = phone;
    }

    @Column(name = "email")
    @Email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "skype")
    public String getSkype() {
        return skype;
    }

    public void setSkype(String skype) {
        this.skype = skype;
    }

    @OneToOne(mappedBy = "contact")
    @JsonIgnore
    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    @Column(name = "owner")
    @Enumerated(EnumType.STRING)
    public Owner getOwner() {
        return owner;
    }

    public void setOwner(Owner owner) {
        this.owner = owner;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Contact contact = (Contact) o;

        if (address != null ? !address.equals(contact.address) : contact.address != null) return false;
        if (id != null ? !id.equals(contact.id) : contact.id != null) return false;
        if (name != null ? !name.equals(contact.name) : contact.name != null) return false;
        if (orders != null ? !orders.equals(contact.orders) : contact.orders != null) return false;
        if (phone != null ? !phone.equals(contact.phone) : contact.phone != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (orders != null ? orders.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", address=" + address +
                ", phone=" + phone +
                ", orders=" + orders +
                '}';
    }

    public enum Owner {
        CLIENT, SITE_CONTACT
    }
}