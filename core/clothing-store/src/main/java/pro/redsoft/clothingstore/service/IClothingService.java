package pro.redsoft.clothingstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.domain.products.Product;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */
public interface IClothingService extends CRUDService<Clothing> {

    List<Clothing> findByCategory(Category category);

    List<Clothing> findByBrand(Brand brand);

    List<String> findTitles(String title);

    List<Clothing> findClothingLikeTitle(String title);

    Page<? extends Product> findAllByPage(Pageable pageable);
}
