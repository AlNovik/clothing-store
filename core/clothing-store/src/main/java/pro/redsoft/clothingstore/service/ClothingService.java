package pro.redsoft.clothingstore.service;

import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.domain.products.Product;
import pro.redsoft.clothingstore.repository.ClothingRepository;
import pro.redsoft.clothingstore.repository.ProductRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Repository("clothingService")
@Transactional
public class ClothingService implements IClothingService {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private ClothingRepository clothingRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Clothing> findByCategory(Category category) {
        return clothingRepository.findByCategory(category);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Clothing> findByBrand(Brand brand) {
        return clothingRepository.findByBrand(brand);
    }

    @Override
    public List<String> findTitles(String title) {
        return clothingRepository.findModelsClothing("%" + title + "%");
    }

    @Override
    public List<Clothing> findClothingLikeTitle(String title) {
        return clothingRepository.findLikeModel("%" + title + "%");
    }

    @Override
    @Transactional(readOnly = true)
    public Page<? extends Product> findAllByPage(Pageable pageable) {
        return clothingRepository.findAll(pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Clothing> findAll() {
        return Lists.newArrayList(productRepository.findAll());
    }

    @Override
    @Transactional(readOnly = true)
    public Clothing findById(Integer id) {
        return (Clothing)productRepository.findOne(id);
    }

    @Override
    public void delete(Integer id) {
        clothingRepository.delete(id);
    }

    @Override
    public void save(Clothing clothing) {
        clothingRepository.save(clothing);
    }
}