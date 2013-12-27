package pro.redsoft.clothingstore.web.rest.parameter;

/**
 * @author Alexander Novik
 *         Date: 27.12.13
 */
public enum Sorting {

    POPULAR("popular"),
    CREATED("created");

    private final String param;

    private Sorting(String param) {
        this.param = param;
    }

    public String param() {
        return param;
    }
}
