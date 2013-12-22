package pro.redsoft.clothingstore.service;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 13.10.13
 */
public interface CRUDService<T> {

    List<T> findAll();

    T findById(Long id);

    void delete(Long id);

    void delete(T t);

    T create(T t);

    T modify(T t);
}
