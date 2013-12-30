package pro.redsoft.clothingstore.service.validation.annotation;


import pro.redsoft.clothingstore.service.validation.UniqueTitleValidator;

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
@Constraint(validatedBy = {UniqueTitleValidator.class})
public @interface UniqueTitle {

    Class<? extends Payload>[] payload() default {};

    String message() default "{pro.redsoft.clothingstore.validation.UniqueTitle.message}";

    Class<?>[] groups() default {};
}
