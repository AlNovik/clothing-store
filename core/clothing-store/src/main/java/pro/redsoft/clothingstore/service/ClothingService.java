package pro.redsoft.clothingstore.service;

import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.domain.products.Clothing;
import pro.redsoft.clothingstore.repository.ClothingRepository;

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
    public List<String> findModels() {
//        return null;
        return entityManager.createNamedQuery("clothing.model").getResultList();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Clothing> findAll() {
        return Lists.newArrayList(clothingRepository.findAll());
    }

    @Override
    @Transactional(readOnly = true)
    public Clothing findById(Integer id) {
        return clothingRepository.findOne(id);
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
