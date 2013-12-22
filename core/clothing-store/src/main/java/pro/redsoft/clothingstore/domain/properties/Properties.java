package pro.redsoft.clothingstore.domain.properties;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

/**
 * @author Alexander Novik
 *         Date: 19.12.13
 */

@Embeddable
public class Properties implements Serializable {

    private static final long serialVersionUID = -6072799079178219591L;

    private DateTime created;
    private DateTime updated;
    private Integer modify;
    private Boolean visible = false;
    private String url;

    @Column(name = "created")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    public DateTime getCreated() {
        return created;
    }

    public void setCreated(DateTime created) {
        this.created = created;
    }

    @Column(name = "updated")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    public DateTime getUpdated() {
        return updated;
    }

    public void setUpdated(DateTime updated) {
        this.updated = updated;
    }

    @Column(name = "modify")
    public Integer getModify() {
        return modify;
    }

    public void setModify(Integer modify) {
        this.modify = modify;
    }

    @Column(name = "visible")
    public Boolean isVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }

    @Column(name = "url")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Properties that = (Properties) o;

        if (created != null ? !created.equals(that.created) : that.created != null) return false;
        if (updated != null ? !updated.equals(that.updated) : that.updated != null) return false;
        if (modify != null ? !modify.equals(that.modify) : that.modify != null) return false;
        if (url != null ? !url.equals(that.url) : that.url != null) return false;
        if (visible != null ? !visible.equals(that.visible) : that.visible != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = created != null ? created.hashCode() : 0;
        result = 31 * result + (updated != null ? updated.hashCode() : 0);
        result = 31 * result + (modify != null ? modify.hashCode() : 0);
        result = 31 * result + (visible != null ? visible.hashCode() : 0);
        result = 31 * result + (url != null ? url.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Properties{" +
                "created=" + created +
                ", updated=" + updated +
                ", modify=" + modify +
                ", visible=" + visible +
                ", url='" + url + '\'' +
                '}';
    }
}
