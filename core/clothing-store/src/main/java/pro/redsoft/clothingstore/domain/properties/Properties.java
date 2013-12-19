package pro.redsoft.clothingstore.domain.properties;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.sql.Date;

/**
 * @author Alexander Novik
 *         Date: 19.12.13
 */

@Embeddable
public class Properties implements Serializable {

    private Date createDate;
    private Date lastModify;
    private Integer modify;
    private Boolean visible;
    private String url;

    @Column(name = "createDate")
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Column(name = "lastModify")
    public Date getLastModify() {
        return lastModify;
    }

    public void setLastModify(Date lastModify) {
        this.lastModify = lastModify;
    }

    @Column(name = "modify")
    public Integer getModify() {
        return modify;
    }

    public void setModify(Integer modify) {
        this.modify = modify;
    }

    @Column(name = "visible")
    public Boolean getVisible() {
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

        if (createDate != null ? !createDate.equals(that.createDate) : that.createDate != null) return false;
        if (lastModify != null ? !lastModify.equals(that.lastModify) : that.lastModify != null) return false;
        if (modify != null ? !modify.equals(that.modify) : that.modify != null) return false;
        if (url != null ? !url.equals(that.url) : that.url != null) return false;
        if (visible != null ? !visible.equals(that.visible) : that.visible != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = createDate != null ? createDate.hashCode() : 0;
        result = 31 * result + (lastModify != null ? lastModify.hashCode() : 0);
        result = 31 * result + (modify != null ? modify.hashCode() : 0);
        result = 31 * result + (visible != null ? visible.hashCode() : 0);
        result = 31 * result + (url != null ? url.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Properties{" +
                "createDate=" + createDate +
                ", lastModify=" + lastModify +
                ", modify=" + modify +
                ", visible=" + visible +
                ", url='" + url + '\'' +
                '}';
    }
}
