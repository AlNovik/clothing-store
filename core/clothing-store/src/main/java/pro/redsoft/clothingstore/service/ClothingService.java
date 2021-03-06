package pro.redsoft.clothingstore.service;

import com.google.common.collect.Lists;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.domain.products.Product;
import pro.redsoft.clothingstore.repository.BrandRepository;
import pro.redsoft.clothingstore.repository.CategoryRepository;
import pro.redsoft.clothingstore.repository.ClothingRepository;
//import pro.redsoft.clothingstore.repository.ProductRepository;

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
    private CategoryRepository categoryRepository;

    @Autowired
    private BrandRepository brandRepository;

//    @Autowired
//    private ProductRepository productRepository;

    @Override
    public Clothing findByTitle(String title) {
        return clothingRepository.findByTitle(title);
    }

    @Override
    public List<Clothing> findByTitleCollection(List<String> titles) {
        return clothingRepository.findByTitleCollection(titles);
    }

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
    public Page<Clothing> findPageByCategory(Category category, Pageable pageable) {
        return clothingRepository.findByCategory(category, pageable);
    }

    @Override
    public Page<Clothing> findPageByBrand(Brand brand, Pageable pageable) {
        return clothingRepository.findByBrand(brand, pageable);
    }

    @Override
    public List<Clothing> findSortDataTables(String query, Sort sort) {
        return Lists.newArrayList(clothingRepository.findDataTables("%" + query + "%", sort));
    }

    @Override
    public List<Clothing> search(Clothing clothing) {
        return null;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Clothing> findAll() {
        return Lists.newArrayList(clothingRepository.findAll());
    }

    @Override
    @Transactional(readOnly = true)
    public Clothing findById(Long id) {
        return clothingRepository.findOne(id);
    }

    @Override
    public void delete(Long id) {
        clothingRepository.delete(id);
    }

    @Override
    public void delete(Clothing clothing) {
        clothingRepository.delete(clothing);
    }

    @Override
    public Clothing create(Clothing clothing) {
        clothing.setBrand(brandRepository.findOne(clothing.getBrand().getId()));
        clothing.setCategory(categoryRepository.findOne(clothing.getCategory().getId()));
        return clothingRepository.save(clothing);
    }

    @Override
    public void modify(Clothing clothing) {
        clothing.getProperties().setUpdated(new DateTime());
        clothing.getProperties().setModify(clothing.getProperties().getModify() + 1);
        clothingRepository.save(clothing);
    }
}
