package pro.redsoft.clothingstore.repository;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import pro.redsoft.clothingstore.domain.order.Orders;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 29.11.13
 */
public interface OrderRepository extends CrudRepository<Orders, Long> {

    @Query("SELECT o FROM Orders o WHERE o.contact.phone.number LIKE :query")
    List<Orders> findDataTables(@Param("query") String query, Sort sort);
}
