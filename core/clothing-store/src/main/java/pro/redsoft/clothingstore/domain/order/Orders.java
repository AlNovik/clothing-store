package pro.redsoft.clothingstore.domain.order;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.Length;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;
import pro.redsoft.clothingstore.domain.Contact;
import pro.redsoft.clothingstore.domain.DomainObject;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */
@Entity
@Table(name = "orders")
public class Orders extends DomainObject implements Serializable {

    private static final long serialVersionUID = 8729276045907878723L;

    private Long id;
    private DateTime create = new DateTime();
    private DateTime updated = new DateTime();
    private OrderStatus status = OrderStatus.NEW;
    private List<OrderItem> items;
    private Contact contact;
    private String note;

    public Orders() {
    }

    @Id
    @Column(name = "id")
    @GeneratedValue
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "date_create")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    public DateTime getCreate() {
        return create;
    }

    public void setCreate(DateTime create) {
        this.create = create;
    }

    @Column(name = "date_update")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    public DateTime getUpdated() {
        return updated;
    }

    public void setUpdated(DateTime updated) {
        this.updated = updated;
    }

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    @ElementCollection
    @CollectionTable(
            name = "order_items",
            joinColumns = @JoinColumn(name = "order_id")
    )
    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "contact_id")
    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    @Column(name = "note")
    @Length(max = 100, message = "Длинна сообщения должна быть не более 500 символов")
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orders orders = (Orders) o;

        if (contact != null ? !contact.equals(orders.contact) : orders.contact != null) return false;
        if (create != null ? !create.equals(orders.create) : orders.create != null) return false;
        if (id != null ? !id.equals(orders.id) : orders.id != null) return false;
        if (items != null ? !items.equals(orders.items) : orders.items != null) return false;
        if (status != orders.status) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (create != null ? create.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (items != null ? items.hashCode() : 0);
        result = 31 * result + (contact != null ? contact.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", create=" + create +
                ", status=" + status +
                ", items=" + items +
                ", contact=" + contact +
                '}';
    }

    public enum OrderStatus {

        NEW, PROCESSED, CLOSED, CANCELED

    }
}
