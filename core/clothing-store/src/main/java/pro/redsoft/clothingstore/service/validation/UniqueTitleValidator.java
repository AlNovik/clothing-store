package pro.redsoft.clothingstore.service.validation;

import org.springframework.beans.factory.annotation.Autowired;
import pro.redsoft.clothingstore.service.IClothingService;
import pro.redsoft.clothingstore.service.validation.annotation.UniqueTitle;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * @author Alexander Novik
 *         Date: 30.12.13
 */
public class UniqueTitleValidator implements ConstraintValidator<UniqueTitle,String> {

    @Autowired
    private IClothingService clothingService;

    @Override
    public void initialize(UniqueTitle constraintAnnotation) {
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        return clothingService.findByTitle(value) == null;
    }
}
