package pro.redsoft.clothingstore.domain.order;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */
@Entity
@Table(name = "Order")
public class Order implements Serializable {

    private Integer id;
    private Date date;
    private List<OrderItem> items;

    public Order() {
    }

    @Id
    @Column(name = "id")
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @ElementCollection
    @CollectionTable(
            name="order_items",
            joinColumns=@JoinColumn(name="order_id")
    )
    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
}
