package pro.redsoft.clothingstore.repository;

import org.springframework.data.repository.CrudRepository;
import pro.redsoft.clothingstore.domain.order.Orders;

/**
 * @author Alexander Novik
 *         Date: 29.11.13
 */
public interface OrderRepository extends CrudRepository<Orders, Long> {

//    @Query("SELECT o FROM Orders o WHERE o.contact.phone.number LIKE :query")
//    List<Orders> findDataTables(@Param("query") String query, Sort sort);
}
