package pro.redsoft.clothingstore.service.validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import pro.redsoft.clothingstore.domain.products.Clothing;

/**
 * @author Alexander Novik
 *         Date: 10.12.13
 */

@Component
public class ProductValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return Clothing.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Clothing clothing = (Clothing) target;
    }
}
