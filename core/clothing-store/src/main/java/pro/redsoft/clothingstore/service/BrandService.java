package pro.redsoft.clothingstore.service;

import com.google.common.collect.Lists;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pro.redsoft.clothingstore.domain.attributes.Brand;
import pro.redsoft.clothingstore.repository.BrandRepository;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 30.11.13
 */

@Repository("companyService")
@Transactional
public class BrandService implements IBrandService {

    @Autowired
    private BrandRepository brandRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Brand> findAll() {
        return Lists.newArrayList(brandRepository.findAll());
    }

    @Override
    @Transactional(readOnly = true)
    public Brand findById(Long id) {
        return brandRepository.findOne(id);
    }

    @Override
    public void delete(Long id) {
        brandRepository.delete(id);
    }

    @Override
    public void delete(Brand brand) {
        brandRepository.delete(brand);
    }

    @Override
    public Brand create(Brand brand) {
        DateTime currentDate = new DateTime();
        brand.getProperties().setCreated(currentDate);
        brand.getProperties().setUpdated(currentDate);
        brand.getProperties().setModify(0);
        return brandRepository.save(brand);
    }

    @Override
    public void modify(Brand brand) {
        brand.getProperties().setUpdated(new DateTime());
        brand.getProperties().setModify(brand.getProperties().getModify() + 1);
        brandRepository.save(brand);
    }

    @Override
    public List<Brand> findAllOrderByTitleAsc() {
        return brandRepository.findAllOrderByTitleAsc();
    }

    @Override
    public List<Brand> findSortDatatables(String query, Sort sort) {
        return brandRepository.findSortDataTables("%" + query + "%", sort);
    }
}
