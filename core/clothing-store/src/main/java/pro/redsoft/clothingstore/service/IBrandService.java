package pro.redsoft.clothingstore.service;

import org.springframework.data.domain.Sort;
import pro.redsoft.clothingstore.domain.attributes.Brand;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 30.11.13
 */
public interface IBrandService extends CRUDService<Brand> {

    List<Brand> findAllOrderByTitleAsc();

    List<Brand> findSortDatatables(String query,Sort sort);

    Brand findByTitle(String title);
}
