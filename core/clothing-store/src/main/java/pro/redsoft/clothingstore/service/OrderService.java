package pro.redsoft.clothingstore.service;

import com.google.common.collect.Lists;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
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
    public Orders save(Orders orders) {
        return orderRepository.save(orders);
    }

    @Override
    public Orders createOrder(Orders orders) {

        orders.setDateCreate(new DateTime());
        orders.setStatus(Orders.OrderStatus.NEW);
        return orders;
    }
}
