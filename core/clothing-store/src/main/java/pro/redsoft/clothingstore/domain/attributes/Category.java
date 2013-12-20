package pro.redsoft.clothingstore.domain.attributes;

import org.codehaus.jackson.annotate.JsonIgnore;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.domain.properties.Properties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */
@Entity
@Table(name = "category")
public class Category implements Serializable {

    private static final long serialVersionUID = 9061366754793151468L;

    private Long id;
    private String title;
    private List<Clothing> clothings;
    private String description;
    private Properties properties;

    public Category() {
    }

    public Category(String title) {
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
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @OneToMany(mappedBy = "category")
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

        Category category = (Category) o;

        if (!id.equals(category.id)) return false;
        if (properties != null ? !properties.equals(category.properties) : category.properties != null) return false;
        if (!title.equals(category.title)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id.hashCode();
        result = 31 * result + title.hashCode();
        result = 31 * result + (properties != null ? properties.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", properties=" + properties +
                '}';
    }
}
