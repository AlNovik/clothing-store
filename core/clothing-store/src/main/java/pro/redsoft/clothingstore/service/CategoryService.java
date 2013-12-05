package pro.redsoft.clothingstore.service;

import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pro.redsoft.clothingstore.domain.attributes.Category;
import pro.redsoft.clothingstore.repository.CategoryRepository;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 30.11.13
 */

@Repository("categoryService")
@Transactional
public class CategoryService implements ICategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Category> findAll() {
        return Lists.newArrayList(categoryRepository.findAll());
    }

    @Override
    @Transactional(readOnly = true)
    public Category findById(Integer id) {
        return categoryRepository.findOne(id);
    }

    @Override
    public void delete(Integer id) {
        categoryRepository.delete(id);
    }

    @Override
    public void save(Category category) {
        categoryRepository.save(category);
    }
}
