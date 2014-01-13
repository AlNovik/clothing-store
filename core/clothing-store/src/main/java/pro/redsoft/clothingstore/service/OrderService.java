package pro.redsoft.clothingstore.service;

import com.google.common.collect.Lists;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pro.redsoft.clothingstore.domain.order.Orders;
import pro.redsoft.clothingstore.repository.OrderRepository;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 21.12.13
 */

@Repository("orderService")
@Transactional
public class OrderService implements IOrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public List<Orders> findAll() {
        return Lists.newArrayList(orderRepository.findAll());
    }

    @Override
    public Orders findById(Long id) {
        return orderRepository.findOne(id);
    }

    @Override
    public void delete(Long id) {
        orderRepository.delete(id);
    }

    @Override
    public void delete(Orders orders) {
        orderRepository.delete(orders);
    }

    @Override
    public Orders create(Orders orders) {
        return orderRepository.save(orders);
    }

    @Override
    public void modify(Orders orders) {
        orders.setUpdated(new DateTime());
        orderRepository.save(orders);
    }

    @Override
    public List<Orders> findSortDatatables(String query, Sort sort) {
//        return orderRepository.findDataTables("%" + query + "%", sort);
        return null;
    }
}
