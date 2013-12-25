package pro.redsoft.clothingstore.web.pagination;

import pro.redsoft.clothingstore.domain.DomainObject;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 24.12.13
 */
public class DataTablesResponse<T extends DomainObject> implements Serializable{

    private static final long serialVersionUID = 7484495095132831315L;

    private Integer sEcho;
    private Integer iTotalRecords;
    private Integer iTotalDisplayRecords;
    private List<T> aaData;

    public DataTablesResponse() {
    }

    public void setsEcho(Integer sEcho) {
        this.sEcho = sEcho;
    }

    public void setiTotalRecords(Integer iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }

    public void setiTotalDisplayRecords(Integer iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public void setAaData(List<T> aaData) {
        this.aaData = aaData;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getsEcho() {
        return sEcho;
    }

    public Integer getiTotalRecords() {
        return iTotalRecords;
    }

    public Integer getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public List<T> getAaData() {
        return aaData;
    }
}
