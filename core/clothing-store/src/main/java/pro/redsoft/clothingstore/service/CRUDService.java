package pro.redsoft.clothingstore.service;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 13.10.13
 */
public interface CRUDService<T> {

    List<T> findAll();

    T findById(Integer id);

    void delete(Integer id);

    void save(T t);
}
