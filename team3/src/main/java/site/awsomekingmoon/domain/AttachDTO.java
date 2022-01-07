package site.awsomekingmoon.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * @author 안병수
 * @AttachDto
 */
@Data @NoArgsConstructor @AllArgsConstructor
public class AttachDTO {
	/**파일 원래이름*/
	private String origin;
	/**파일 경로*/
	private String path;
	/**임의로 변환된 파일 uuid*/
	private String uuid;
	/**파일 확장자*/
	private String ext;
	/**파일 mime타입*/
	private String mime;
	/**파일 사이즈*/
	private Long size;
	/**이미지 여부*/
	private boolean image;
	
	public AttachDTO(String fullPath) {
		/**파일 확장자*/
        ext = fullPath.substring(fullPath.lastIndexOf(".") + 1);
        /**파일 전체경로*/
        fullPath = fullPath.replace("."+ext,"");
        /**파일 경로*/
        path = fullPath.substring(0,fullPath.lastIndexOf("/"));
        /**db에저장될 파일 uuid*/
        uuid = fullPath.substring(fullPath.lastIndexOf("/") + 1);
    }
	/**섬네일명*/
	public String getThumb() {
		return path + "/s_" + uuid + "." + ext;
	}
	/**파일 경로*/
	public String getFullPath() {
		return path + "/" + uuid + "." + ext;
	}
}
