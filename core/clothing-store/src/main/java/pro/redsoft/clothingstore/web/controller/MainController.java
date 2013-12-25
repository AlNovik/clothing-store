package pro.redsoft.clothingstore.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pro.redsoft.clothingstore.service.IClothingService;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Controller
public class MainController {

    @Autowired
    private IClothingService clothingService;


    @RequestMapping("/")
    public String home() {
        return "redirect:/index";
    }

    @RequestMapping("/index")
    public String showIndexPage() {
        return "index";
    }

    @RequestMapping("/catalog")
    public String catalogPage() {
        return "catalog";
    }

    @RequestMapping("/catalog/page/{page}")
    public String clothingPage(@PathVariable Integer page) {
        return "catalog";
    }

    @RequestMapping("/catalog/brand/{id}")
    public String company(@PathVariable Integer id) {
        return "catalog";
    }

    @RequestMapping("/catalog/brand/{id}/page/{page}")
    public String brandByPage(@PathVariable Integer id,
                              @PathVariable Integer page) {
        return "catalog";
    }

    @RequestMapping("/catalog/category/{id}")
    public String category(@PathVariable Integer id) {
        return "catalog";
    }

    @RequestMapping("/catalog/category/{id}/page/{page}")
    public String categoryByPage(@PathVariable Integer id,
                                 @PathVariable Integer page) {
        return "catalog";
    }

    @RequestMapping(value = "/clothing/{id}")
    public String item(@PathVariable Integer id) {
        return "item";
    }

    @RequestMapping("/information")
    public String information() {
        return "information";
    }

    @RequestMapping("/about")
    public String about() {
        return "about";
    }

    @RequestMapping("/contacts")
    public String contacts() {
        return "contacts";
    }

    @RequestMapping("/search")
    public String search() {
        return "search";
    }

    @RequestMapping("/shopping")
    public String shopping() {
        return "shopping";
    }
}
