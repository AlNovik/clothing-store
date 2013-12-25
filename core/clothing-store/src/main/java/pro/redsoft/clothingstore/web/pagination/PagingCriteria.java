package pro.redsoft.clothingstore.web.pagination;

import com.google.common.collect.Lists;
import org.springframework.data.domain.Sort;

import java.util.List;

/**
 * @author Alexander Novik
 *         Date: 24.12.13
 */
public final class PagingCriteria
{
    private final Integer displayStart;
    private final Integer displaySize;
    private final List<Sort> sortFields;
    private final Integer pageNumber;

    public PagingCriteria(Integer displayStart, Integer displaySize, Integer pageNumber, List<Sort> sortFields)
    {
        this.displayStart = displayStart;
        this.displaySize = displaySize;
        this.pageNumber = pageNumber;
        this.sortFields = sortFields;
    }

    public Integer getDisplayStart() {
        return displayStart;
    }

    public Integer getDisplaySize() {
        return displaySize;
    }

    public List<Sort> getSortFields()
    {
        return Lists.newArrayList(sortFields);
    }

    public Integer getPageNumber()
    {
        return pageNumber;
    }

}
