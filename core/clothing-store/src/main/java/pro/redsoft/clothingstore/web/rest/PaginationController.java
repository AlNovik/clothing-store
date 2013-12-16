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
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.domain.products.Product;
import pro.redsoft.clothingstore.service.IBrandService;
import pro.redsoft.clothingstore.service.ICategoryService;
import pro.redsoft.clothingstore.service.IClothingService;
import pro.redsoft.clothingstore.web.pagination.ProductPage;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Alexander Novik
 *         Date: 06.12.13
 */

@Controller
@RequestMapping("/catalog")
public class PaginationController {

    Logger logger = LoggerFactory.getLogger(PaginationController.class);

    @Autowired
    private IClothingService clothingService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private IBrandService brandService;

    @ResponseBody
    @RequestMapping
    public ProductPage catalog(@RequestParam(value = "size", required = false, defaultValue = "16") Integer size,
                               @RequestParam(value = "sortBy", required = false) String sortBy,
                               @RequestParam(value = "order", required = false) String order) {

        Sort sort = null;
        if (sortBy != null && order != null) {
            if (order.equals("desc")) {
                sort = new Sort(Sort.Direction.DESC, sortBy);
            } else {
                sort = new Sort(Sort.Direction.ASC, sortBy);
            }
        }

        PageRequest pageRequest = null;
        if (sort != null) {
            pageRequest = new PageRequest(1 - 1, size, sort);
        } else {
            pageRequest = new PageRequest(1 - 1, size);
        }

        Page<? extends Product> page = clothingService.findAllByPage(pageRequest);

        ProductPage productPage = new ProductPage();
        productPage.setCurrentPage(page.getNumber() + 1);
        productPage.setTotalPages(page.getTotalPages());
        productPage.setTotalRecords(page.getTotalElements());
        productPage.setClothings(Lists.newArrayList(page.iterator()));
        return productPage;
    }

    @RequestMapping(value = "/page/{pageNumber}", method = RequestMethod.GET)
    @ResponseBody
    public ProductPage catalogByPage(@PathVariable(value = "pageNumber") Integer pageNumber,
                                     @RequestParam(value = "size", required = false) Integer size,
                                     @RequestParam(value = "sortBy", required = false) String sortBy,
                                     @RequestParam(value = "order", required = false) String order) {

        Sort sort = null;
        if (sortBy != null && order != null) {
            if (order.equals("desc")) {
                sort = new Sort(Sort.Direction.DESC, sortBy);
            } else {
                sort = new Sort(Sort.Direction.ASC, sortBy);
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

    @RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ProductPage productCategory(@PathVariable(value = "id") Integer id,
                                       @RequestParam(value = "size", required = false) Integer size,
                                       @RequestParam(value = "sortBy", required = false) String sortBy,
                                       @RequestParam(value = "order", required = false) String order) {

        Sort sort = null;
        if (sortBy != null && order != null) {
            if (order.equals("desc")) {
                sort = new Sort(Sort.Direction.DESC, sortBy);
            } else {
                sort = new Sort(Sort.Direction.ASC, sortBy);
            }
        }

        PageRequest pageRequest = null;
        if (sort != null) {
            pageRequest = new PageRequest(1 - 1, size, sort);
        } else {
            pageRequest = new PageRequest(1 - 1, size);
        }

        Category category = categoryService.findById(id);
        Page<Clothing> page = clothingService.findPageByCategory(category, pageRequest);
        Map<String, Object> properties = new HashMap<String, Object>();
        properties.put("type", "Категория");
        properties.put("description", category);

        ProductPage productPage = new ProductPage();
        productPage.setCurrentPage(page.getNumber() + 1);
        productPage.setTotalPages(page.getTotalPages());
        productPage.setTotalRecords(page.getTotalElements());
        productPage.setClothings(Lists.newArrayList(page.iterator()));
        productPage.setProperties(properties);
        return productPage;
    }

    @RequestMapping(value = "/category/{id}/page/{pageNumber}", method = RequestMethod.GET)
    @ResponseBody
    public ProductPage productCategoryByPage(@PathVariable(value = "id") Integer id,
                                             @PathVariable(value = "pageNumber") Integer pageNUmber,
                                             @RequestParam(value = "size", required = false) Integer size,
                                             @RequestParam(value = "sortBy", required = false) String sortBy,
                                             @RequestParam(value = "order", required = false) String order) {

        Sort sort = null;
        if (sortBy != null && order != null) {
            if (order.equals("desc")) {
                sort = new Sort(Sort.Direction.DESC, sortBy);
            } else {
                sort = new Sort(Sort.Direction.ASC, sortBy);
            }
        }

        PageRequest pageRequest = null;
        if (sort != null) {
            pageRequest = new PageRequest(pageNUmber - 1, size, sort);
        } else {
            pageRequest = new PageRequest(pageNUmber - 1, size);
        }

        Category category = categoryService.findById(id);
        Page<Clothing> page = clothingService.findPageByCategory(category, pageRequest);
        Map<String, Object> properties = new HashMap<String, Object>();
        properties.put("type", "Категория");
        properties.put("description", category);

        ProductPage productPage = new ProductPage();
        productPage.setCurrentPage(page.getNumber() + 1);
        productPage.setTotalPages(page.getTotalPages());
        productPage.setTotalRecords(page.getTotalElements());
        productPage.setClothings(Lists.newArrayList(page.iterator()));
        productPage.setProperties(properties);
        return productPage;
    }

    @RequestMapping(value = "/brand/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ProductPage productBrand(@PathVariable(value = "id") Integer id,
                                    @RequestParam(value = "size", required = false) Integer size,
                                    @RequestParam(value = "sortBy", required = false) String sortBy,
                                    @RequestParam(value = "order", required = false) String order) {

        Sort sort = null;
        if (sortBy != null && order != null) {
            if (order.equals("desc")) {
                sort = new Sort(Sort.Direction.DESC, sortBy);
            } else {
                sort = new Sort(Sort.Direction.ASC, sortBy);
            }
        }

        PageRequest pageRequest = null;
        if (sort != null) {
            pageRequest = new PageRequest(1 - 1, size, sort);
        } else {
            pageRequest = new PageRequest(1 - 1, size);
        }

        Brand brand = brandService.findById(id);
        Page<Clothing> page = clothingService.findPageByBrand(brand, pageRequest);
        Map<String, Object> properties = new HashMap<String, Object>();
        properties.put("type", "Брэнд");
        properties.put("description", brand);

        ProductPage productPage = new ProductPage();
        productPage.setCurrentPage(page.getNumber() + 1);
        productPage.setTotalPages(page.getTotalPages());
        productPage.setTotalRecords(page.getTotalElements());
        productPage.setClothings(Lists.newArrayList(page.iterator()));
        productPage.setProperties(properties);
        return productPage;
    }

    @RequestMapping(value = "/brand/{id}/page/{pageNumber}", method = RequestMethod.GET)
    @ResponseBody
    public ProductPage productBrandByPage(@PathVariable(value = "id") Integer id,
                                          @PathVariable(value = "pageNumber") Integer pageNumber,
                                          @RequestParam(value = "size", required = false) Integer size,
                                          @RequestParam(value = "sortBy", required = false) String sortBy,
                                          @RequestParam(value = "order", required = false) String order) {

        Sort sort = null;
        if (sortBy != null && order != null) {
            if (order.equals("desc")) {
                sort = new Sort(Sort.Direction.DESC, sortBy);
            } else {
                sort = new Sort(Sort.Direction.ASC, sortBy);
            }
        }

        PageRequest pageRequest = null;
        if (sort != null) {
            pageRequest = new PageRequest(pageNumber - 1, size, sort);
        } else {
            pageRequest = new PageRequest(pageNumber - 1, size);
        }

        Brand brand = brandService.findById(id);
        Page<Clothing> page = clothingService.findPageByBrand(brand, pageRequest);
        Map<String, Object> properties = new HashMap<String, Object>();
        properties.put("type", "Брэнд");
        properties.put("description", brand);

        ProductPage productPage = new ProductPage();
        productPage.setCurrentPage(page.getNumber() + 1);
        productPage.setTotalPages(page.getTotalPages());
        productPage.setTotalRecords(page.getTotalElements());
        productPage.setClothings(Lists.newArrayList(page.iterator()));
        productPage.setProperties(properties);
        return productPage;
    }
}
