package com.estate.business.building;

import java.util.List;

import com.estate.domain.building.TpImage;

public interface TpImageService {

	public TpImage read(Long id);

	public Long saveEntity(TpImage tb);

	public void saveOrUpdate(TpImage tb);

	public List<TpImage> readByCategory(int category, long pid, int startrow,
			int endrow) throws Exception;

	public List<TpImage> readByImgType(int imgtype, long pid) throws Exception;

	// 获取户型总数
	public int unitTotal(long pid, int category) throws Exception;

	// 获取所有类型类型数目
	public List<Object[]> imgageTypeGroupNum(long pid) throws Exception;
	
	/**
	 * 根据二手房主键查找其图片列表
	 * @param id
	 * @return
	 */
	public List<TpImage> findBySecondBulidId(Long id);
	
	/**
	 * 根据二手房主键查找其图片列表,分页查找方式
	 * 
	 * @return
	 */
	public List<TpImage> findBySecondBulidId(Long id, int pageNo, int limit);
	
	public void deleteById(Long id);
	/**
	 * 根据pid查出相应模块对应的图片
	 */
    public  List<TpImage>  getTpImageList(long pid);
}
