package pro.redsoft.clothingstore.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import pro.redsoft.clothingstore.domain.attributes.Brand;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 30.11.13
 */
public interface BrandRepository extends CrudRepository<Brand, Long> {

    Brand findByTitle(String title);

    @Query("SELECT b FROM Brand b ORDER BY b.title ASC")
    List<Brand> findAllOrderByTitleAsc();

    @Query("SELECT b FROM Brand b WHERE b.properties.url=:url")
    Brand findByUrl(String url);
}
