package pro.redsoft.clothingstore.service;

import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
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
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Brand create(Brand manufacturer) {
        return brandRepository.save(manufacturer);
    }

    @Override
    public Brand modify(Brand brand) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Brand> findAllOrderByTitleAsc() {
        return brandRepository.findAllOrderByTitleAsc();
    }
}
