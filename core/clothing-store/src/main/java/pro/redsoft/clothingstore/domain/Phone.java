package pro.redsoft.clothingstore.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

/**
 * @author Alexander Novik
 *         Date: 29.11.13
 */

@Embeddable
public class Phone implements Serializable {

    private static final long serialVersionUID = -7125966782368127575L;

    private String title;
    private String number;

    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "number")
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Phone phone = (Phone) o;

        if (number != null ? !number.equals(phone.number) : phone.number != null) return false;
        if (title != null ? !title.equals(phone.title) : phone.title != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = title != null ? title.hashCode() : 0;
        result = 31 * result + (number != null ? number.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Phone{" +
                "title='" + title + '\'' +
                ", number='" + number + '\'' +
                '}';
    }
}
