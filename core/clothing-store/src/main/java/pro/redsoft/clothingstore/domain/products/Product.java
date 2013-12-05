package pro.redsoft.clothingstore.domain.products;

import pro.redsoft.clothingstore.domain.attributes.Image;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Product implements Serializable {

    private Integer id;
    private String title;
    private Double price;
    private String description;
    private Set<Image> images;
    private Boolean visible;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.TABLE)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "price")
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @ElementCollection
    @CollectionTable(
            name="product_images",
            joinColumns=@JoinColumn(name="product_id")
    )
    public Set<Image> getImages() {
        return images;
    }

    public void setImages(Set<Image> images) {
        this.images = images;
    }

    @Column(name = "visible")
    public Boolean getVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }
}
