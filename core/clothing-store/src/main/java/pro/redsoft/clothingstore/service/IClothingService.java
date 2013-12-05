package pro.redsoft.clothingstore.service;

import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.products.Clothing;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */
public interface IClothingService extends CRUDService<Clothing> {

    List<Clothing> findByCategory(Category category);

    List<Clothing> findByBrand(Brand brand);

    List<String> findModels();
}
