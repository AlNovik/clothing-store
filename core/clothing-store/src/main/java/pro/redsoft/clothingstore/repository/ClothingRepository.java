package pro.redsoft.clothingstore.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.products.Clothing;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */
public interface ClothingRepository extends PagingAndSortingRepository<Clothing,Integer> {

    List<Clothing> findByCategory(Category category);

    List<Clothing> findByBrand(Brand brand);

//    @Query(name = "clothing.findModels", value ="select c.model from Clothing c")
//    List<String> findModelsClothing();
}
