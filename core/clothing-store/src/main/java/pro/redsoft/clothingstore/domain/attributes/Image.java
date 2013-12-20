package pro.redsoft.clothingstore.domain.attributes;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

/**
 * @author Alexander Novik
 *         Date: 28.11.13
 */

@Embeddable
@JsonIgnoreProperties({"bytes"})
public class Image implements Serializable {

    private static final long serialVersionUID = 5970534188521154392L;

    private String fileName;
    private String fileSize;
    private String fileType;
    private String link;
    private String title;
//    private byte[] bytes;

    public Image() {
    }

    public Image(String link) {
        this.link = link;
    }

    @Column(name = "link")
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

//    public byte[] getBytes() {
//        return bytes;
//    }
//
//    public void setBytes(byte[] bytes) {
//        this.bytes = bytes;
//    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Image image = (Image) o;

        if (link != null ? !link.equals(image.link) : image.link != null) return false;
        if (title != null ? !title.equals(image.title) : image.title != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = link != null ? link.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Image{" +
                "link='" + link + '\'' +
                ", title='" + title + '\'' +
                '}';
    }
}
