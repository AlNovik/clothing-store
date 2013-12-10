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
import pro.redsoft.clothingstore.service.IClothingService;

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

    @RequestMapping
    @ResponseBody
    public Map<String,List<Clothing>> search(@RequestParam(value = "title", required = false, defaultValue = "") String title){

        Map<String,List<Clothing>> result = new HashMap<String, List<Clothing>>();
        result.put("clothing",clothingService.findClothingLikeTitle(title));
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


}