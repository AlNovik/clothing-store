//package pro.redsoft.clothingstore.service;
//
//import org.springframework.data.repository.CrudRepository;
//import pro.redsoft.clothingstore.domain.products.Product;
//
//import java.util.Map;
//
///**
// * @author Alexander Novik
// *         Date: 05.12.13
// */
//public class ProductService implements CrudRepository<Product, Integer>{
//
//    Map<Class<? extends Product>, CrudRepository<Product, Integer>> map;
//
//    // put(odeshda, odeshdaService)
//
//    void save(Product product){
//        map.get(product.getClass()).save()
//    }
//}
