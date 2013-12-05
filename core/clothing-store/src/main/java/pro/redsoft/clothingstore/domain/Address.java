package pro.redsoft.clothingstore.domain;

import javax.persistence.Embeddable;
import java.io.Serializable;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Embeddable
public class Address implements Serializable {

    private String city;
    private String street;
    private Integer house;
    private Integer building;
    private Integer flat;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public Integer getHouse() {
        return house;
    }

    public void setHouse(Integer house) {
        this.house = house;
    }

    public Integer getBuilding() {
        return building;
    }

    public void setBuilding(Integer building) {
        this.building = building;
    }

    public Integer getFlat() {
        return flat;
    }

    public void setFlat(Integer flat) {
        this.flat = flat;
    }
}
