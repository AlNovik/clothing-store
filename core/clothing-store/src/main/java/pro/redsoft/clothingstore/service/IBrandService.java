package pro.redsoft.clothingstore.service;

import pro.redsoft.clothingstore.domain.attributes.Brand;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 30.11.13
 */
public interface IBrandService extends CRUDService<Brand> {

    List<Brand> findAllOrderByTitleAsc();


}
