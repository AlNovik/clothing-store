package pro.redsoft.clothingstore.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import pro.redsoft.clothingstore.domain.attributes.Category;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 30.11.13
 */
public interface CategoryRepository extends CrudRepository<Category,Integer> {

    Category findByTitle(String title);

    @Query("SELECT c FROM Category c ORDER BY c.title ASC")
    List<Category> findAllOrderByTitleAsc();

    @Query("SELECT c FROM Category c WHERE c.properties.url=:url")
    Category findByUrl(String url);
}
