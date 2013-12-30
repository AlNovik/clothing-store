package pro.redsoft.clothingstore.service.validation;

import org.springframework.beans.factory.annotation.Autowired;
import pro.redsoft.clothingstore.service.ICategoryService;
import pro.redsoft.clothingstore.service.validation.annotation.UniqueCategory;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * @author Alexander Novik
 *         Date: 30.12.13
 */
public class UniqueCategoryValidator implements ConstraintValidator<UniqueCategory,String> {

    @Autowired
    private ICategoryService categoryService;

    @Override
    public void initialize(UniqueCategory constraintAnnotation) {
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        return categoryService.findByTitle(value) == null;
    }
}
