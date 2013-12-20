package pro.redsoft.clothingstore.domain.products;

import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.attributes.Image;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Entity
@Table(name = "clothing")
public class Clothing extends Product {

    private static final long serialVersionUID = 8682446347509462415L;

    private List<Short> height;
    private List<Short> size;
    private Set<String> cloth;
    private Set<String> color;
    private Set<String> season;
    private Category category;
    private Brand brand;

    public Clothing() {
    }

    public Clothing(String title, Double price, Set<Image> images, List<Short> height, List<Short> size, Category category, Brand brand) {
        super(title, price, images);
        this.height = height;
        this.size = size;
        this.category = category;
        this.brand = brand;
    }

    @ElementCollection
    @CollectionTable(name = "clothing_height", joinColumns = @JoinColumn(name = "clothing_id"))
    public List<Short> getHeight() {
        return height;
    }

    public void setHeight(List<Short> height) {
        this.height = height;
    }

    @ElementCollection
    @CollectionTable(name = "clothing_size", joinColumns = @JoinColumn(name = "clothing_id"))
    public List<Short> getSize() {
        return size;
    }

    public void setSize(List<Short> size) {
        this.size = size;
    }

    @ElementCollection
    @CollectionTable(name = "clothing_cloth", joinColumns = @JoinColumn(name = "clothing_id"))
    public Set<String> getCloth() {
        return cloth;
    }

    public void setCloth(Set<String> cloth) {
        this.cloth = cloth;
    }

    @ElementCollection
    @CollectionTable(name = "clothing_color", joinColumns = @JoinColumn(name = "clothing_id"))
    public Set<String> getColor() {
        return color;
    }

    public void setColor(Set<String> color) {
        this.color = color;
    }

    @ElementCollection
    @CollectionTable(name = "clothing_season", joinColumns = @JoinColumn(name = "clothing_id"))
    public Set<String> getSeason() {
        return season;
    }

    public void setSeason(Set<String> season) {
        this.season = season;
    }

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "category")
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "brand")
    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        Clothing clothing = (Clothing) o;

        if (brand != null ? !brand.equals(clothing.brand) : clothing.brand != null) return false;
        if (category != null ? !category.equals(clothing.category) : clothing.category != null) return false;
        if (cloth != null ? !cloth.equals(clothing.cloth) : clothing.cloth != null) return false;
        if (color != null ? !color.equals(clothing.color) : clothing.color != null) return false;
        if (height != null ? !height.equals(clothing.height) : clothing.height != null) return false;
        if (season != null ? !season.equals(clothing.season) : clothing.season != null) return false;
        if (size != null ? !size.equals(clothing.size) : clothing.size != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + (height != null ? height.hashCode() : 0);
        result = 31 * result + (size != null ? size.hashCode() : 0);
        result = 31 * result + (cloth != null ? cloth.hashCode() : 0);
        result = 31 * result + (color != null ? color.hashCode() : 0);
        result = 31 * result + (season != null ? season.hashCode() : 0);
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (brand != null ? brand.hashCode() : 0);
        return result;
    }

    @Override
    public String
    toString() {
        return "Clothing{" +
                "height=" + height +
                ", size=" + size +
                ", category=" + category +
                ", brand=" + brand +
                '}';
    }
}
