package pro.redsoft.clothingstore.web.rest;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.service.IClothingService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Novik
 *         Date: 06.12.13
 */

@Controller
@RequestMapping("/search")
public class SearchController {

    Logger logger = LoggerFactory.getLogger(SearchController.class);

    @Autowired
    private IClothingService clothingService;

    @RequestMapping("/test")
    @ResponseBody
    public Map<String, List<Clothing>> searchtest(@RequestBody String query) {

        Map<String, List<Clothing>> result = new HashMap<String, List<Clothing>>();
        ObjectMapper mapper = new ObjectMapper();
        Clothing search = null;
        try {
            search = mapper.readValue(query, Clothing.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        List<Clothing> clothings = clothingService.search(search);
        result.put("clothings", clothings);

        return result;
    }

    @RequestMapping
    @ResponseBody
    public Map<String, List<Clothing>> search(@RequestParam(value = "title", required = false, defaultValue = "") String title) {

        Map<String, List<Clothing>> result = new HashMap<String, List<Clothing>>();
        result.put("clothing", clothingService.findClothingLikeTitle(title));
        return result;
    }

    @RequestMapping(value = "/model", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<String>> modelList(@RequestParam(value = "title", required = false, defaultValue = "") String title) {

        Map<String, List<String>> result = new HashMap<String, List<String>>();
        List<String> titles = clothingService.findTitles(title);
        logger.info("List models : " + titles);
        result.put("title", titles);
        return result;
    }

    @RequestMapping(value = "/clothing", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, List<Clothing>> findClothingByTitle(@RequestParam(value = "titles[]") List<String> titles) {

        Map<String, List<Clothing>> result = new HashMap<String, List<Clothing>>();
        List<Clothing> clothings = new ArrayList<Clothing>();
//        List<Clothing> clothings = clothingService.findByTitleCollection(titles);
        for (String title : titles) {
            Clothing clothing = clothingService.findByTitle(title);
            clothings.add(clothing);
        }
        result.put("products", clothings);
        return result;
    }


}
