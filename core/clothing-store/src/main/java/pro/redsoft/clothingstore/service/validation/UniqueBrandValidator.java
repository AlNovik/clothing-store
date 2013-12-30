package pro.redsoft.clothingstore.service.validation;

import org.springframework.beans.factory.annotation.Autowired;
import pro.redsoft.clothingstore.service.IBrandService;
import pro.redsoft.clothingstore.service.validation.annotation.UniqueBrand;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * @author Alexander Novik
 *         Date: 30.12.13
 */
public class UniqueBrandValidator implements ConstraintValidator<UniqueBrand,String> {

    @Autowired
    private IBrandService brandService;

    @Override
    public void initialize(UniqueBrand constraintAnnotation) {
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        return brandService.findByTitle(value) == null;
    }
}
