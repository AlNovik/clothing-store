package pro.redsoft.clothingstore.web.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.service.IBrandService;
import pro.redsoft.clothingstore.service.ICategoryService;
import pro.redsoft.clothingstore.service.IClothingService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Novik
 *         Date: 04.12.13
 */

@Controller
public class DataTableController {

    Logger logger = LoggerFactory.getLogger(DataTableController.class);

    @Autowired
    private IClothingService clothingService;

    @Autowired
    private IBrandService brandService;

    @Autowired
    private ICategoryService categoryService;


    @RequestMapping(value = "/tables/clothing", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> catalogTable(@RequestParam(value = "sEcho", required = false) Integer sEcho,
                                            @RequestParam(value = "iDisplayLength",required = false) Integer iDisplayLength,
                                            @RequestParam(value = "iDisplayStart",required = false) Integer iDisplayStart,
                                            @RequestParam(value = "iSortCol_0",required = false) Integer iSortCol_0,
                                            @RequestParam(value = "sSortDir_0",required = false) String sSortDir_0 ) {

        Map<String, Object> response = new HashMap<String, Object>();
        List<Clothing> clothings = clothingService.findAll();
        List<Map<String, String>> tableData = new ArrayList<Map<String, String>>();
        for (Clothing clothing : clothings) {
            Map<String, String> item = new HashMap<String, String>();
            item.put("0", clothing.getId().toString());
            item.put("1", clothing.getModel());
            item.put("2", clothing.getBrand().getTitle());
            item.put("3", clothing.getCategory().getTitle());
            item.put("4", "test");
            tableData.add(item);
        }
        response.put("aaData", tableData);
        response.put("iTotalRecords", clothings.size());
        response.put("iTotalDisplayRecords", clothings.size());
        response.put("sEcho", sEcho);
        return response;
    }
}
