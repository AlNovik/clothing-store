package pro.redsoft.clothingstore.web.rest;

import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pro.redsoft.clothingstore.domain.products.Product;
import pro.redsoft.clothingstore.service.IClothingService;
import pro.redsoft.clothingstore.web.pagination.ProductPage;

/**
 * @author Alexander Novik
 *         Date: 06.12.13
 */

@Controller
@RequestMapping
public class PaginationController {

    Logger logger = LoggerFactory.getLogger(PaginationController.class);

    @Autowired
    private IClothingService clothingService;

    @RequestMapping(value = "/clothing/page/{pageNumber}", method = RequestMethod.GET)
    @ResponseBody
    public ProductPage productGrid(@PathVariable(value = "pageNumber") Integer pageNumber,
                                   @RequestParam(value = "size", required = false, defaultValue = "16") Integer size,
                                   @RequestParam(value = "sortBy", required = false) String sortBy,
                                   @RequestParam(value = "order", required = false) String order) {

        Sort sort = null;
        String orderBy = sortBy;
        if (orderBy != null && order != null) {
            if (order.equals("desc")) {
                sort = new Sort(Sort.Direction.DESC, orderBy);
            } else {
                sort = new Sort(Sort.Direction.ASC, orderBy);
            }
        }

        PageRequest pageRequest = null;
        if (sort != null) {
            pageRequest = new PageRequest(pageNumber - 1, size, sort);
        } else {
            pageRequest = new PageRequest(pageNumber - 1, size);
        }

        Page<? extends Product> page = clothingService.findAllByPage(pageRequest);

        ProductPage productPage = new ProductPage();
        productPage.setCurrentPage(page.getNumber() + 1);
        productPage.setTotalPages(page.getTotalPages());
        productPage.setTotalRecords(page.getTotalElements());
        productPage.setClothings(Lists.newArrayList(page.iterator()));
        return productPage;
    }
}
