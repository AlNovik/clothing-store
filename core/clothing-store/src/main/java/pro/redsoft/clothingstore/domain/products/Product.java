package pro.redsoft.clothingstore.domain.products;

import org.hibernate.validator.constraints.NotEmpty;
import pro.redsoft.clothingstore.domain.DomainObject;
import pro.redsoft.clothingstore.domain.attributes.Image;
import pro.redsoft.clothingstore.domain.properties.Properties;
import pro.redsoft.clothingstore.service.validation.annotation.UniqueTitle;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Set;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Product extends DomainObject implements Serializable {

    private static final long serialVersionUID = 6906437706286113838L;

    private Long id;
    private String title;
    private Double price;
    private String description;
    private Set<Image> images;
    private Properties properties;

    protected Product() {
    }

    protected Product(String title, Double price, Set<Image> images) {
        this.title = title;
        this.price = price;
        this.images = images;
    }

    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.TABLE)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "title", unique = true)
    @NotEmpty(message = "Заполните поле")
    @UniqueTitle
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "price")
    @Min(value = 0, message ="Неверное значение")
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
            name = "product_images",
            joinColumns = @JoinColumn(name = "product_id")
    )
    public Set<Image> getImages() {
        return images;
    }

    public void setImages(Set<Image> images) {
        this.images = images;
    }

    @Embedded
    public Properties getProperties() {
        return properties;
    }

    public void setProperties(Properties properties) {
        this.properties = properties;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product product = (Product) o;

        if (description != null ? !description.equals(product.description) : product.description != null) return false;
        if (id != null ? !id.equals(product.id) : product.id != null) return false;
        if (images != null ? !images.equals(product.images) : product.images != null) return false;
        if (price != null ? !price.equals(product.price) : product.price != null) return false;
        if (title != null ? !title.equals(product.title) : product.title != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (images != null ? images.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", images=" + images +
                '}';
    }
}
