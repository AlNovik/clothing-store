package pro.redsoft.clothingstore.service;

import com.google.common.collect.Lists;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
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
    public Category findById(Long id) {
        return categoryRepository.findOne(id);
    }

    @Override
    public void delete(Long id) {
        categoryRepository.delete(id);
    }

    @Override
    public void delete(Category category) {
        categoryRepository.delete(category);
    }

    @Override
    public Category create(Category category) {
        DateTime currentDate = new DateTime();
        category.getProperties().setCreated(currentDate);
        category.getProperties().setUpdated(currentDate);
        category.getProperties().setModify(0);
        return categoryRepository.save(category);
    }

    @Override
    public void modify(Category category) {
        category.getProperties().setUpdated(new DateTime());
        category.getProperties().setModify(category.getProperties().getModify() + 1);
        categoryRepository.save(category);
    }

    @Override
    public List<Category> findAllOrderByTitleAsc() {
        return categoryRepository.findAllOrderByTitleAsc();
    }

    @Override
    public List<Category> findSortDatatables(String query, Sort sort) {
        return categoryRepository.findSortDataTables("%" + query + "%", sort);
    }
}
