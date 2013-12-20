package pro.redsoft.clothingstore.repository;

import org.springframework.data.repository.CrudRepository;
import pro.redsoft.clothingstore.domain.Contact;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */
public interface ContactRepository extends CrudRepository<Contact,Long> {
}
