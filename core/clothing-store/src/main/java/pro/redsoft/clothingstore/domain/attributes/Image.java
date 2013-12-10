package pro.redsoft.clothingstore.domain.attributes;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Embeddable
public class Image implements Serializable {

    private String link;
    private String title;

    public Image() {
    }

    public Image(String link) {
        this.link = link;
    }

    @Column(name = "link")
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Image image = (Image) o;

        if (link != null ? !link.equals(image.link) : image.link != null) return false;
        if (title != null ? !title.equals(image.title) : image.title != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = link != null ? link.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Image{" +
                "link='" + link + '\'' +
                ", title='" + title + '\'' +
                '}';
    }
}
