package pro.redsoft.clothingstore.domain.products;

import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Entity
@Table(name = "Clothing")
@NamedQueries(
        @NamedQuery(name = "clothing.models",query = "select c.model from Clothing c")
)
public class Clothing extends Product implements Serializable {

    private String model;
    private List<Short> height;
    private List<Short> size;
    private Category category;
    private Brand brand;

    @Column(name = "model")
    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    @Column(name = "height")
    @ElementCollection
    public List<Short> getHeight() {
        return height;
    }

    public void setHeight(List<Short> height) {
        this.height = height;
    }

    @Column(name = "size")
    @ElementCollection
    public List<Short> getSize() {
        return size;
    }

    public void setSize(List<Short> size) {
        this.size = size;
    }

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "category")
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "brand")
    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }
}
