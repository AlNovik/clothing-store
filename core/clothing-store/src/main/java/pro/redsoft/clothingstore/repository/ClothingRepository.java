package pro.redsoft.clothingstore.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.products.Clothing;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */
public interface ClothingRepository extends PagingAndSortingRepository<Clothing, Long> {

    List<Clothing> findByCategory(Category category);

    List<Clothing> findByBrand(Brand brand);

    Clothing findByTitle(String title);

    @Query("SELECT c FROM Clothing c WHERE c.title IN :titles")
    List<Clothing> findByTitleCollection(List<String> titles);

    @Query("SELECT c.title FROM Clothing c WHERE c.title LIKE :title")
    List<String> findModelsClothing(@Param("title") String title);

    @Query("SELECT c FROM Clothing c WHERE c.title LIKE :query OR c.category.title LIKE :query OR c.brand.title LIKE :query")
    List<Clothing> findDataTables(@Param("query") String query, Sort sort);

    @Query("SELECT c FROM Clothing c WHERE c.title LIKE :title")
    List<Clothing> findLikeModel(@Param("title") String title);

    Page<Clothing> findByCategory(Category category, Pageable pageable);

    Page<Clothing> findByBrand(Brand brand, Pageable pageable);
}
