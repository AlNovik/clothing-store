package pro.redsoft.clothingstore.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.products.Clothing;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */
public interface ClothingRepository extends ProductRepository<Clothing,Integer> {

    List<Clothing> findByCategory(Category category);

    List<Clothing> findByBrand(Brand brand);

    @Query("SELECT c.title FROM Clothing c WHERE c.title LIKE :title")
    List<String> findModelsClothing(@Param("title")String title);

    @Query("SELECT c FROM Clothing c WHERE c.title LIKE :title")
    List<Clothing> findLikeModel(@Param("title")String title);
}
