package pro.redsoft.clothingstore.web.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.service.IBrandService;
import pro.redsoft.clothingstore.service.ICategoryService;
import pro.redsoft.clothingstore.service.IClothingService;

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
    public Clothing findClothingById(@PathVariable Integer id) {
        Clothing clothing = clothingService.findById(id);
        return clothing;
    }

    @RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Clothing>> findClothingByCategory(@PathVariable Integer id) {

        Category category = categoryService.findById(id);
        List<Clothing> clothings = clothingService.findByCategory(category);
        logger.info("Found " + clothings.size() + " categories");
        Map<String, List<Clothing>> listClothinds = new HashMap<String, List<Clothing>>();
        listClothinds.put("clothings", clothings);
        return listClothinds;
    }

    @RequestMapping(value = "/brand/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Clothing>> findClothingByBrand(@PathVariable Integer id) {

        Brand brand = brandService.findById(id);
        List<Clothing> clothings = clothingService.findByBrand(brand);
        logger.info("Found " + clothings.size() + " clothings");
        Map<String, List<Clothing>> listClothinds = new HashMap<String, List<Clothing>>();
        listClothinds.put("clothings", clothings);
        return listClothinds;
    }

    @RequestMapping(value = "/clothing", method = RequestMethod.POST)
    @ResponseBody
    public Clothing createClothing(@RequestBody Clothing clothing) {

        logger.info("Creating clothing: " + clothing);
        clothingService.save(clothing);
        logger.info("Clothing created successfully with info: " + clothing);
        return clothing;
    }

    @RequestMapping(value = "/clothing/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public void updateClothing(@RequestBody Clothing clothing, @PathVariable Integer id) {

        logger.info("Updating clothing: " + clothing);
        clothingService.save(clothing);
        logger.info("Clothing updated successfully with info: " + clothing);
    }

    @RequestMapping(value = "/clothing/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteClothing(@PathVariable Integer id) {

        logger.info("Deleting clothing with id: " + id);
        clothingService.delete(id);
        logger.info("Clothing deleted successfully");
    }

    @RequestMapping(value = "/category", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Category>> categories() {

        List<Category> categories = categoryService.findAll();
        logger.info("Found " + categories.size() + " categories");
        Map<String, List<Category>> listCategory = new HashMap<String, List<Category>>();
        listCategory.put("categories", categories);
        return listCategory;
    }

    @RequestMapping(value = "/category",method = RequestMethod.POST)
    @ResponseBody
    public Category createCategory(@RequestBody Category category){
        logger.info("Creating category: " + category);
        categoryService.save(category);
        logger.info("Category created successfully with info: " + category);
        return category;
    }

    @RequestMapping(value = "/brand", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Brand>> brand() {

        List<Brand> brands = brandService.findAll();
        logger.info("Found " + brands.size() + " brands");
        Map<String, List<Brand>> listBrands = new HashMap<String, List<Brand>>();
        listBrands.put("brands", brands);
        return listBrands;
    }
}
