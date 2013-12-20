package pro.redsoft.clothingstore.domain.order;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Embeddable
public class OrderItem implements Serializable {

    private static final long serialVersionUID = 6754228556131749399L;

    private String title;
    private Short size;
    private Integer quantity;

    @Column(name = "quantity")
    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "size")
    public Short getSize() {
        return size;
    }

    public void setSize(Short size) {
        this.size = size;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderItem orderItem = (OrderItem) o;

        if (quantity != null ? !quantity.equals(orderItem.quantity) : orderItem.quantity != null) return false;
        if (size != null ? !size.equals(orderItem.size) : orderItem.size != null) return false;
        if (title != null ? !title.equals(orderItem.title) : orderItem.title != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = title != null ? title.hashCode() : 0;
        result = 31 * result + (size != null ? size.hashCode() : 0);
        result = 31 * result + (quantity != null ? quantity.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "title='" + title + '\'' +
                ", size=" + size +
                ", quantity=" + quantity +
                '}';
    }
}
