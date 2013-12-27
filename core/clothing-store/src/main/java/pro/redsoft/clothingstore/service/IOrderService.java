package pro.redsoft.clothingstore.service;

import org.springframework.data.domain.Sort;
import pro.redsoft.clothingstore.domain.order.Orders;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 21.12.13
 */
public interface IOrderService extends CRUDService<Orders> {

    List<Orders> findSortDatatables(String query,Sort sort);
}
