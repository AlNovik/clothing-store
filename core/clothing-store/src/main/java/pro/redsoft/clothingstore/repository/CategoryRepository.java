package pro.redsoft.clothingstore.repository;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import pro.redsoft.clothingstore.domain.attributes.Category;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 30.11.13
 */
public interface CategoryRepository extends CrudRepository<Category,Long> {

    Category findByTitle(String title);

    @Query("SELECT c FROM Category c ORDER BY c.title ASC")
    List<Category> findAllOrderByTitleAsc();

    @Query("SELECT c FROM Category c WHERE c.properties.url=:url")
    Category findByUrl(String url);

    @Query("SELECT c FROM Category c WHERE c.title LIKE :query")
    List<Category> findSortDataTables(@Param("query")String query,Sort sort);
}
