package pro.redsoft.clothingstore.service;

import pro.redsoft.clothingstore.domain.attributes.Category;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 30.11.13
 */
public interface ICategoryService extends CRUDService<Category> {

    List<Category> findAllOrderByTitleAsc();
}
