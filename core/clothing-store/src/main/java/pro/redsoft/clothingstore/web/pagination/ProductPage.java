package pro.redsoft.clothingstore.web.pagination;

import pro.redsoft.clothingstore.domain.products.Product;

import java.util.List;
import java.util.Map;

/**
 * @author Alexander Novik
 *         Date: 06.12.13
 */
public class ProductPage {

    private int totalPages;
    private int currentPage;
    private long totalRecords;
    private List<? extends Product> clothings;
    private Map<String,Object> properties;

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public long getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(long totalRecords) {
        this.totalRecords = totalRecords;
    }

    public List<? extends Product> getClothings() {
        return clothings;
    }

    public void setClothings(List<? extends Product> clothings) {
        this.clothings = clothings;
    }

    public Map<String,Object> getProperties() {
        return properties;
    }

    public void setProperties(Map<String,Object> properties) {
        this.properties = properties;
    }
}
