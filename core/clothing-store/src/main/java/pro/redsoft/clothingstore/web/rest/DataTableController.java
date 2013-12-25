package pro.redsoft.clothingstore.web.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.service.IBrandService;
import pro.redsoft.clothingstore.service.ICategoryService;
import pro.redsoft.clothingstore.service.IClothingService;
import pro.redsoft.clothingstore.web.pagination.DataTablesRequest;
import pro.redsoft.clothingstore.web.pagination.DataTablesResponse;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 04.12.13
 */

@Controller
@RequestMapping("/table")
public class DataTableController {

    Logger logger = LoggerFactory.getLogger(DataTableController.class);

    @Autowired
    private IClothingService clothingService;

    @Autowired
    private IBrandService brandService;

    @Autowired
    private ICategoryService categoryService;


    @RequestMapping(value = "/clothing", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    public DataTablesResponse<Clothing> clothing(@RequestBody DataTablesRequest request) {

        System.err.println(request);
        List<Clothing> clothing = clothingService.findAll();
        DataTablesResponse<Clothing> response = new DataTablesResponse<Clothing>();
        response.setsEcho(request.getsEcho());
        response.setiTotalRecords(clothing.size());
        response.setiTotalDisplayRecords(clothing.size());
        response.setAaData(clothing.subList(1, 25));
        logger.info("Таблица товаров построена: товаров({}), на странице({})", clothing.size(), 25);
        return response;
    }

    @RequestMapping(value = "/category", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    public DataTablesResponse<Category> category(@RequestBody DataTablesRequest request) {

        System.err.println(request);
        List<Category> categories = categoryService.findAll();
        DataTablesResponse<Category> response = new DataTablesResponse<Category>();
        response.setsEcho(request.getsEcho());
        response.setiTotalRecords(categories.size());
        response.setiTotalDisplayRecords(categories.size());
        if (categories.size() < 25)
            categories = categories.subList(1, categories.size());
        else
            categories = categories.subList(1, 25);
        response.setAaData(categories);
        return response;
    }

    @RequestMapping(value = "/brand", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    public DataTablesResponse<Brand> brand(@RequestBody DataTablesRequest request) {

        System.err.println(request);
        List<Brand> brands = brandService.findAll();
        DataTablesResponse<Brand> response = new DataTablesResponse<Brand>();
        response.setsEcho(request.getsEcho());
        response.setiTotalRecords(brands.size());
        response.setiTotalDisplayRecords(brands.size());
        if (brands.size() < 25)
            brands = brands.subList(1, brands.size());
        else
            brands = brands.subList(1, 25);
        response.setAaData(brands);
        return response;
    }
}
