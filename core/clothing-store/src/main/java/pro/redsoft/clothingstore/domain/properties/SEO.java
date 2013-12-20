package pro.redsoft.clothingstore.domain.properties;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

/**
 * @author Alexander Novik
 *         Date: 19.12.13
 */

@Embeddable
public class SEO implements Serializable {

    private static final long serialVersionUID = -1775154505711633056L;

    private String title;
    private String keywords;
    private String description;

    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "keywords")
    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
