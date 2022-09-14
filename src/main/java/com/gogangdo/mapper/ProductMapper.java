package com.gogangdo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.ReviewDTO;
import com.gogangdo.dto.FileDTO;
import com.gogangdo.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	int selectProductNo();


	void registerProduct(ProductDTO dto);


	List<ProductDTO> selectProductList(int pageNo);


	int selectProductCount();


	FileDTO selectImageFile(int fno);


	List<ProductDTO> selectProductList(int pageNo, int category_no);

	List<ProductDTO> selectProductSubList(Map<Object, Object> map);
	
	
//	List<ProductDTO> selectProductLowPrice(int pageNo, int product_price);
//	List<ProductDTO> selectProductHighPrice(int pageNo, int product_price);
	
	void insertthumbnail(FileDTO fileDTO);
	void insertproduct_img(FileDTO fileDTO);
	int selectImageNo();
	ProductDTO selectproductDTO(int product_no);
	FileDTO selectThumbnailDTO(int product_no);
	FileDTO selectimageDTO(int product_no);
  
	List<ReviewDTO> selectReviewList(Map<String, Integer> map);




	int selectReviewCount(int product_no);



}
