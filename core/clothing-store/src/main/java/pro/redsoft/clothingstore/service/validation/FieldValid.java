package pro.redsoft.clothingstore.service.validation;

/**
 * @author Alexander Novik
 *         Date: 29.12.13
 */
public class FieldValid {

    private String field;
    private String message;

    public FieldValid(String field, String message) {
        this.field = field;
        this.message = message;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
