package pro.redsoft.clothingstore.web.pagination;

import pro.redsoft.clothingstore.domain.products.Product;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 06.12.13
 */
public class ProductPage {

    private int totalPages;
    private int currentPage;
    private long totalRecords;
    private List<Product> clothings;

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

    public List<Product> getClothings() {
        return clothings;
    }

    public void setClothings(List<Product> clothings) {
        this.clothings = clothings;
    }
}
