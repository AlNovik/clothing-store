package pro.redsoft.clothingstore.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Controller
public class MainController {

    @RequestMapping("/")
    public String home() {
        return "redirect:/index";
    }

    @RequestMapping("/index")
    public String showIndexPage() {
        return "index";
    }

    @RequestMapping("/clothing")
    public String catalogPage(){
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
    public String about(){
        return "about";
    }

    @RequestMapping("/contacts")
    public String contacts() {
        return "contacts";
    }

    @RequestMapping("/brand/{id}")
    public String company(@PathVariable Integer id){
        return "brand";
    }

    @RequestMapping("/category/{id}")
    public String category(@PathVariable Integer id){
        return "category";
    }
}
