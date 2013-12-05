package pro.redsoft.clothingstore.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * @author Alexander Novik
 *         Date: 29.11.13
 */

@Embeddable
public class Phone {

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
}
