package pro.redsoft.clothingstore.domain.attributes;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.NotEmpty;
import pro.redsoft.clothingstore.domain.DomainObject;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.domain.properties.Properties;
import pro.redsoft.clothingstore.service.validation.annotation.UniqueBrand;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Entity
@Table(name = "brand")
public class Brand extends DomainObject implements Serializable {

    private static final long serialVersionUID = -6455343988949202689L;

    private Long id;
    private String title;
    private List<Clothing> clothings;
    private String description;
    private Properties properties;

    public Brand() {
    }

    public Brand(String title) {
        this.title = title;
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

    @Column(name = "title", unique = true, nullable = false)
    @NotEmpty(message = "Заполните поле")
    @UniqueBrand
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @OneToMany(mappedBy = "brand", cascade = CascadeType.ALL)
    @JsonIgnore
    public List<Clothing> getClothings() {
        return clothings;
    }

    public void setClothings(List<Clothing> clothings) {
        this.clothings = clothings;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

        Brand brand = (Brand) o;

        if (clothings != null ? !clothings.equals(brand.clothings) : brand.clothings != null) return false;
        if (id != null ? !id.equals(brand.id) : brand.id != null) return false;
        if (title != null ? !title.equals(brand.title) : brand.title != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (clothings != null ? clothings.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Brand{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", properties=" + properties +
                '}';
    }
}
