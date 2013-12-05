package pro.redsoft.clothingstore.domain.attributes;

import org.codehaus.jackson.annotate.JsonIgnore;
import pro.redsoft.clothingstore.domain.products.Clothing;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Entity
@Table(name = "Brand")
public class Brand implements Serializable {

    private Integer id;
    private String title;
    private String url;
    private List<Clothing> clothings;

    @Id
    @Column(name = "id")
    @GeneratedValue
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

    @Column(name = "url")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @OneToMany(mappedBy = "brand")
    @JsonIgnore
    public List<Clothing> getClothings() {
        return clothings;
    }

    public void setClothings(List<Clothing> clothings) {
        this.clothings = clothings;
    }
}
