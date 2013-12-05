package pro.redsoft.clothingstore.web.table;

import pro.redsoft.clothingstore.domain.products.Clothing;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 04.12.13
 */
public class ClothingTable {

    private int totalPages;
    private int currentPage;
    private long totalRecords;
    private List<Clothing> bookData;

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

    public List<Clothing> getBookData() {
        return bookData;
    }

    public void setBookData(List<Clothing> bookData) {
        this.bookData = bookData;
    }
}
