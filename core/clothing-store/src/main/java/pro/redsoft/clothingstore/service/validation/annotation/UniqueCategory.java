package pro.redsoft.clothingstore.service.validation.annotation;

import pro.redsoft.clothingstore.service.validation.UniqueCategoryValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * @author Alexander Novik
 *         Date: 30.12.13
 */

@Target({METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER})
@Retention(RUNTIME)
@Constraint(validatedBy = {UniqueCategoryValidator.class})
public @interface UniqueCategory {
    Class<? extends Payload>[] payload() default {};
    String message() default "{pro.redsoft.clothingstore.validation.UniqueCategory.message}";
    Class<?>[] groups() default {};
}
