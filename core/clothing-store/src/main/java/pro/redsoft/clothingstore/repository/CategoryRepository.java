package pro.redsoft.clothingstore.repository;

import org.springframework.data.repository.CrudRepository;
import pro.redsoft.clothingstore.domain.attributes.Category;

/**
 * @author Alexander Novik
 *         Date: 30.11.13
 */
public interface CategoryRepository extends CrudRepository<Category,Integer> {
}
