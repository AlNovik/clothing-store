package pro.redsoft.clothingstore.web.pagination;

import pro.redsoft.clothingstore.domain.products.Clothing;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 03.01.14
 */
public class ShoppingCart {

    private List<? extends Clothing> products;
    private int quantity;
    private double totalPrice;

    public void setProducts(List<? extends Clothing> products) {
        this.products = products;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
