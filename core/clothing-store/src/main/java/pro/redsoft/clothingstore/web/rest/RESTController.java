package pro.redsoft.clothingstore.web.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.order.Orders;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.service.IBrandService;
import pro.redsoft.clothingstore.service.ICategoryService;
import pro.redsoft.clothingstore.service.IClothingService;
import pro.redsoft.clothingstore.service.IOrderService;
import pro.redsoft.clothingstore.service.validation.FieldValidMessage;

import javax.validation.Valid;
import java.util.*;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Controller
public class RESTController {

    Logger logger = LoggerFactory.getLogger(RESTController.class);

    private MessageSource messageSource;

    @Autowired
    private IClothingService clothingService;

    @Autowired
    private IBrandService brandService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private IOrderService orderService;

    @RequestMapping(value = "/clothing", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Clothing>> findAllClothings(@RequestParam(value = "start", required = false, defaultValue = "0") Integer start,
                                                        @RequestParam(value = "length", required = false, defaultValue = "10") Integer length,
                                                        @RequestParam(value = "sort", required = false) String sort) {


        List<Clothing> clothing = clothingService.findAll();
        logger.info("Found " + clothing.size() + " items");
        Map<String, List<Clothing>> response = new HashMap<String, List<Clothing>>();
        if (clothing.size() < start + length) {
            response.put("clothing", clothing.subList(start, clothing.size()));
        } else {
            response.put("clothing", clothing.subList(start, start + length));
        }
        return response;
    }

    @RequestMapping(value = "/clothing/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Clothing findClothingById(@PathVariable Long id) {
        return clothingService.findById(id);
    }

    @RequestMapping(value = "/clothing/category/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Clothing>> findClothingByCategory(@PathVariable Long id) {

        Category category = categoryService.findById(id);
        List<Clothing> clothings = clothingService.findByCategory(category);
        logger.info("Found " + clothings.size() + " categories");
        Map<String, List<Clothing>> listClothinds = new HashMap<String, List<Clothing>>();
        listClothinds.put("clothings", clothings);
        return listClothinds;
    }

    @RequestMapping(value = "/clothing/brand/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Clothing>> findClothingByBrand(@PathVariable Long id) {

        Brand brand = brandService.findById(id);
        List<Clothing> clothings = clothingService.findByBrand(brand);
        logger.info("Found " + clothings.size() + " clothing");
        Map<String, List<Clothing>> listClothinds = new HashMap<String, List<Clothing>>();
        listClothinds.put("clothings", clothings);
        return listClothinds;
    }

    @RequestMapping(value = "/clothing", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    public Clothing createClothing(@Valid @RequestBody Clothing clothing,
                                   @RequestParam(value = "image", required = false) Set<MultipartFile> images) {

        logger.info("Creating clothing: " + clothing);
        return clothingService.create(clothing);
    }

    @RequestMapping(value = "/clothing/{id}", method = RequestMethod.PUT, headers = {"content-type=application/json"})
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateClothing(@Valid @RequestBody Clothing clothing, @PathVariable Integer id) {
        clothingService.modify(clothing);
    }

    @RequestMapping(value = "/clothing/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteClothing(@PathVariable Long id) {

        logger.info("Deleting clothing with id: " + id);
        clothingService.delete(id);
        logger.info("Clothing deleted successfully");
    }

    @RequestMapping(value = "/category", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Category>> categories() {

        List<Category> categories = categoryService.findAllOrderByTitleAsc();
        logger.info("Found " + categories.size() + " categories");
        Map<String, List<Category>> listCategory = new HashMap<String, List<Category>>();
        listCategory.put("categories", categories);
        return listCategory;
    }

    @RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Category findCategoryById(@PathVariable Long id) {
        return categoryService.findById(id);
    }

    @RequestMapping(value = "/category", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    public Category createCategory(@Valid @RequestBody Category category) {

        logger.info("Creating category: " + category);
        return categoryService.create(category);
    }

    @RequestMapping(value = "/category/{id}", method = RequestMethod.PUT, headers = {"content-type=application/json"})
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateCategory(@Valid @RequestBody Category category, @PathVariable Integer id) {
        categoryService.modify(category);
    }

    @RequestMapping(value = "/category/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteCategory(@PathVariable Long id) {

        logger.info("Deleting category with id: " + id);
        categoryService.delete(id);
        logger.info("Category deleted successfully");
    }

    @RequestMapping(value = "/brand", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Brand>> brand() {

        List<Brand> brands = brandService.findAllOrderByTitleAsc();
        logger.info("Found " + brands.size() + " brands");
        Map<String, List<Brand>> listBrands = new HashMap<String, List<Brand>>();
        listBrands.put("brands", brands);
        return listBrands;
    }

    @RequestMapping(value = "/brand/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Brand findBrandById(@PathVariable Long id) {
        return brandService.findById(id);
    }

    @RequestMapping(value = "/brand", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    public Brand createBrand(@Valid @RequestBody Brand brand) {

        logger.info("Creating brand: " + brand);
        return brandService.create(brand);
    }

    @RequestMapping(value = "/brand/{id}", method = RequestMethod.PUT, headers = {"content-type=application/json"})
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateBrand(@Valid @RequestBody Brand brand, @PathVariable Integer id) {
        brandService.modify(brand);
    }

    @RequestMapping(value = "/brand/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteBrand(@PathVariable Long id) {

        logger.info("Deleting brand with id: " + id);
        brandService.delete(id);
        logger.info("Brand deleted successfully");
    }

    @RequestMapping(value = "/order", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Orders>> orders() {

        List<Orders> orders = orderService.findAll();
        logger.info("Found " + orders.size() + " orders");
        Map<String, List<Orders>> result = new HashMap<String, List<Orders>>();
        result.put("orders", orders);
        return result;
    }

    @RequestMapping(value = "/order", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    public Orders createOrder(@Valid @RequestBody Orders orders) {

        return orderService.create(orders);
    }

    @RequestMapping(value = "/order", method = RequestMethod.PUT, headers = {"content-type=application/json"})
    @ResponseBody
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void editOrder(@Valid @RequestBody Orders orders) {

        orderService.modify(orders);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public Map<String, List<FieldValidMessage>> handleValidationError(MethodArgumentNotValidException e) {
        Map<String, List<FieldValidMessage>> errors = new HashMap<String, List<FieldValidMessage>>();
        List<FieldValidMessage> fieldErrors = new ArrayList<FieldValidMessage>();
        for (ObjectError objectError : e.getBindingResult().getAllErrors()) {
            fieldErrors.add(buildMessage(objectError));
        }
        errors.put("errors", fieldErrors);
        return errors;
    }

    private FieldValidMessage buildMessage(ObjectError objectError) {
        return new FieldValidMessage(((FieldError) objectError).getField(), objectError.getDefaultMessage());
    }
}
