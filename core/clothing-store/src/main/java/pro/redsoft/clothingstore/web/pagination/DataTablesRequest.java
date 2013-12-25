package pro.redsoft.clothingstore.web.pagination;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 24.12.13
 */
public class DataTablesRequest implements Serializable {

    private static final long serialVersionUID = 4925396969034428333L;

    public List<Boolean> abRegex;
    public List<Boolean> abSearchable;
    public List<Boolean> abSortable;
    public List<Integer> aiSortCol;
    public List<String> amDataProp;
    public List<String> asSearch;
    public List<String> asSortDir;
    public Boolean bRegex;
    public Integer iColumns;
    public Integer iDisplayLength;
    public Integer iDisplayStart;
    public Integer iSortingCols;
    public String sColumns;
    public Integer sEcho;
    public String sSearch;

    public DataTablesRequest() {
    }

    public List<Boolean> getAbRegex() {
        return abRegex;
    }

    public void setAbRegex(List<Boolean> abRegex) {
        this.abRegex = abRegex;
    }

    public List<Boolean> getAbSearchable() {
        return abSearchable;
    }

    public void setAbSearchable(List<Boolean> abSearchable) {
        this.abSearchable = abSearchable;
    }

    public List<Boolean> getAbSortable() {
        return abSortable;
    }

    public void setAbSortable(List<Boolean> abSortable) {
        this.abSortable = abSortable;
    }

    public List<Integer> getAiSortCol() {
        return aiSortCol;
    }

    public void setAiSortCol(List<Integer> aiSortCol) {
        this.aiSortCol = aiSortCol;
    }

    public List<String> getAmDataProp() {
        return amDataProp;
    }

    public void setAmDataProp(List<String> amDataProp) {
        this.amDataProp = amDataProp;
    }

    public List<String> getAsSearch() {
        return asSearch;
    }

    public void setAsSearch(List<String> asSearch) {
        this.asSearch = asSearch;
    }

    public List<String> getAsSortDir() {
        return asSortDir;
    }

    public void setAsSortDir(List<String> asSortDir) {
        this.asSortDir = asSortDir;
    }

    public Boolean getbRegex() {
        return bRegex;
    }

    public void setbRegex(Boolean bRegex) {
        this.bRegex = bRegex;
    }

    public Integer getiColumns() {
        return iColumns;
    }

    public void setiColumns(Integer iColumns) {
        this.iColumns = iColumns;
    }

    public Integer getiDisplayLength() {
        return iDisplayLength;
    }

    public void setiDisplayLength(Integer iDisplayLength) {
        this.iDisplayLength = iDisplayLength;
    }

    public Integer getiDisplayStart() {
        return iDisplayStart;
    }

    public void setiDisplayStart(Integer iDisplayStart) {
        this.iDisplayStart = iDisplayStart;
    }

    public Integer getiSortingCols() {
        return iSortingCols;
    }

    public void setiSortingCols(Integer iSortingCols) {
        this.iSortingCols = iSortingCols;
    }

    public String getsColumns() {
        return sColumns;
    }

    public void setsColumns(String sColumns) {
        this.sColumns = sColumns;
    }

    public Integer getsEcho() {
        return sEcho;
    }

    public void setsEcho(Integer sEcho) {
        this.sEcho = sEcho;
    }

    public String getsSearch() {
        return sSearch;
    }

    public void setsSearch(String sSearch) {
        this.sSearch = sSearch;
    }

    @Override
    public String toString() {
        return "DataTablesRequest{" +
                "abRegex=" + abRegex +
                ", abSearchable=" + abSearchable +
                ", abSortable=" + abSortable +
                ", aiSortCol=" + aiSortCol +
                ", amDataProp=" + amDataProp +
                ", asSearch=" + asSearch +
                ", asSortDir=" + asSortDir +
                ", bRegex=" + bRegex +
                ", iColumns=" + iColumns +
                ", iDisplayLength=" + iDisplayLength +
                ", iDisplayStart=" + iDisplayStart +
                ", iSortingCols=" + iSortingCols +
                ", sColumns='" + sColumns + '\'' +
                ", sEcho=" + sEcho +
                ", sSearch='" + sSearch + '\'' +
                '}';
    }
}
