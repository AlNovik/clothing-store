package pro.redsoft.clothingstore.web.rest;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.order.Orders;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.service.IBrandService;
import pro.redsoft.clothingstore.service.ICategoryService;
import pro.redsoft.clothingstore.service.IClothingService;
import pro.redsoft.clothingstore.service.IOrderService;

import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Controller
public class RESTController {

    Logger logger = LoggerFactory.getLogger(RESTController.class);

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
    public Map<String, List<Clothing>> findAllClothings() {

        List<Clothing> clothings = clothingService.findAll();
        logger.info("Found " + clothings.size() + " items");
        Map<String, List<Clothing>> listClothinds = new HashMap<String, List<Clothing>>();
        listClothinds.put("clothings", clothings);
        return listClothinds;
    }

    @RequestMapping(value = "/clothing/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Clothing findClothingById(@PathVariable Long id) {
        Clothing clothing = clothingService.findById(id);
        return clothing;
    }

    @RequestMapping(value = "/clothing", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    public Clothing createClothing(@Valid @RequestBody Clothing clothing) {

        logger.info("Creating clothing: " + clothing);
        return clothingService.create(clothing);
    }

    @RequestMapping(value = "/clothing/{id}", method = RequestMethod.PUT, headers = {"content-type=application/json"})
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateClothing(@Valid @RequestBody String clothing, @PathVariable Integer id) {

        ObjectMapper mapper = new ObjectMapper();
        Clothing modify = null;
        try {
            modify = mapper.readValue(clothing, Clothing.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        clothingService.create(modify);
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
    public Map<String, List<Clothing>> findClothingByCategory(@PathVariable Long id) {

        Category category = categoryService.findById(id);
        List<Clothing> clothings = clothingService.findByCategory(category);
        logger.info("Found " + clothings.size() + " categories");
        Map<String, List<Clothing>> listClothinds = new HashMap<String, List<Clothing>>();
        listClothinds.put("clothings", clothings);
        return listClothinds;
    }

    @RequestMapping(value = "/category", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    public Category createCategory(@Valid @RequestBody Category category) {

        logger.info("Creating category: " + category);
        return categoryService.create(category);
    }

    @RequestMapping(value = "/category/{id}", method = RequestMethod.DELETE)
    @ResponseBody
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

    @RequestMapping(value = "/brand", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    public Brand createBrand(@Valid @RequestBody Brand brand) {

        logger.info("Creating brand: " + brand);
        return brandService.create(brand);
    }

    @RequestMapping(value = "/brand/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Clothing>> findClothingByBrand(@PathVariable Long id) {

        Brand brand = brandService.findById(id);
        List<Clothing> clothings = clothingService.findByBrand(brand);
        logger.info("Found " + clothings.size() + " clothing");
        Map<String, List<Clothing>> listClothinds = new HashMap<String, List<Clothing>>();
        listClothinds.put("clothings", clothings);
        return listClothinds;
    }

    @RequestMapping(value = "/brand/{id}", method = RequestMethod.DELETE)
    @ResponseBody
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

    @RequestMapping(value = "/order",method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    public Orders createOrder(@Valid @RequestBody Orders orders){

        return orderService.createOrder(orders);
    }

    @RequestMapping(value = "/order",method = RequestMethod.PUT, headers = {"content-type=application/json"})
    @ResponseBody
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void editOrder(@Valid @RequestBody String orders){

        ObjectMapper mapper = new ObjectMapper();
        Orders created = null;
        try {
            created = mapper.readValue(orders, Orders.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        orderService.create(created);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public List<String> handleValidationError(MethodArgumentNotValidException e) {
        List<String> errorMessages = new ArrayList<String>();
        for (ObjectError objectError : e.getBindingResult().getAllErrors()) {
            errorMessages.add(buildMessage(objectError));
        }
        return errorMessages;
    }

    private String buildMessage(ObjectError objectError) {
        if (objectError instanceof FieldError) {
            return ((FieldError) objectError).getField() + ": " + objectError.getDefaultMessage();
        } else {
            return objectError.getDefaultMessage();
        }
    }
}
