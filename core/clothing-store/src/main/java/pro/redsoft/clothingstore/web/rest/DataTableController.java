package pro.redsoft.clothingstore.web.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.order.Orders;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.service.IBrandService;
import pro.redsoft.clothingstore.service.ICategoryService;
import pro.redsoft.clothingstore.service.IClothingService;
import pro.redsoft.clothingstore.service.IOrderService;
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

    @Autowired
    private IOrderService orderService;


    @RequestMapping(value = "/clothing", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    public DataTablesResponse<Clothing> clothing(@RequestBody DataTablesRequest request) {

        Sort sort = getSort(request);
        String searchQuery = request.getsSearch();
        List<Clothing> clothing = clothingService.findSortDataTables(searchQuery, sort);
        DataTablesResponse<Clothing> response = new DataTablesResponse<Clothing>();
        response.setsEcho(request.getsEcho());
        response.setiTotalRecords(clothingService.findAll().size());
        response.setiTotalDisplayRecords(clothing.size());
        if (clothing.size() < request.getiDisplayStart() + request.getiDisplayLength()) {
            response.setAaData(clothing.subList(request.getiDisplayStart(), clothing.size()));
        } else {
            response.setAaData(clothing.subList(request.getiDisplayStart(), request.getiDisplayStart() + request.getiDisplayLength()));
        }
        return response;
    }

    @RequestMapping(value = "/category", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    public DataTablesResponse<Category> category(@RequestBody DataTablesRequest request) {

        Sort sort = getSort(request);
        String searchQuery = request.getsSearch();
        List<Category> categories = categoryService.findSortDatatables(searchQuery, sort);
        DataTablesResponse<Category> response = new DataTablesResponse<Category>();
        response.setsEcho(request.getsEcho());
        response.setiTotalRecords(categoryService.findAll().size());
        response.setiTotalDisplayRecords(categories.size());
        if (categories.size() < request.getiDisplayStart() + request.getiDisplayLength())
            categories = categories.subList(request.getiDisplayStart(), categories.size());
        else
            categories = categories.subList(request.getiDisplayStart(), request.getiDisplayStart() + request.getiDisplayLength());
        response.setAaData(categories);
        return response;
    }

    @RequestMapping(value = "/brand", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    public DataTablesResponse<Brand> brand(@RequestBody DataTablesRequest request) {

        Sort sort = getSort(request);
        String searchQuery = request.getsSearch();
        List<Brand> brands = brandService.findSortDatatables(searchQuery, sort);
        DataTablesResponse<Brand> response = new DataTablesResponse<Brand>();
        response.setsEcho(request.getsEcho());
        response.setiTotalRecords(brandService.findAll().size());
        response.setiTotalDisplayRecords(brands.size());
        if (brands.size() < request.getiDisplayStart() + request.getiDisplayLength())
            brands = brands.subList(request.getiDisplayStart(), brands.size());
        else
            brands = brands.subList(request.getiDisplayStart(), request.getiDisplayStart() + request.getiDisplayLength());
        response.setAaData(brands);
        return response;
    }

    @RequestMapping(value = "/order", method = RequestMethod.POST, headers = {"content-type=application/json"})
    @ResponseBody
    public DataTablesResponse<Orders> order(@RequestBody DataTablesRequest request) {

        List<Orders> orders = orderService.findAll();
        DataTablesResponse<Orders> response = new DataTablesResponse<Orders>();
        response.setsEcho(request.getsEcho());
        response.setiTotalRecords(orders.size());
        response.setiTotalDisplayRecords(orders.size());
        if (orders.size() < request.getiDisplayStart() + request.getiDisplayLength())
            orders = orders.subList(request.getiDisplayStart(), orders.size());
        else
            orders = orders.subList(request.getiDisplayStart(), request.getiDisplayStart() + request.getiDisplayLength());
        response.setAaData(orders);
        return response;
    }

    private Sort getSort(DataTablesRequest request) {

        String sortBy = request.getAmDataProp().get(request.getAiSortCol().get(0));
        String order = request.getAsSortDir().get(0);
        Sort sort = null;
        if (order.equals("desc")) {
            sort = new Sort(Sort.Direction.DESC, sortBy);
        } else {
            sort = new Sort(Sort.Direction.ASC, sortBy);
        }
        return sort;
    }

    private DataTablesResponse createResponse() {
        DataTablesResponse response = new DataTablesResponse();

        return response;
    }
}
