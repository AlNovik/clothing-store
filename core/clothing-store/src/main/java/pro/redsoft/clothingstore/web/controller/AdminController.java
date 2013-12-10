package pro.redsoft.clothingstore.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Alexander Novik
 *         Date: 29.11.13
 */

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping
    public String login(){
        return "login";
    }

    @RequestMapping("/products")
    public String catalog(){
        return "admin.products";
    }

    @RequestMapping("/product/add")
    public String addProduct(){
        return "admin.product.add";
    }

    @RequestMapping("/brand/add")
    public String addBrand(){
        return "admin.brand.add";
    }

    @RequestMapping("/category/add")
    public String addCategory(){
        return "admin.category.add";
    }

    @RequestMapping("/orders")
    public String orders(){
        return "admin.orders";
    }

    @RequestMapping("/import")
    public String importation(){
        return "admin.import";
    }

    @RequestMapping("/statistics ")
    public String statistics(){
        return "admin.statistics";
    }

    @RequestMapping("/settings")
    public String settings(){
        return "admin.settings";
    }
}
