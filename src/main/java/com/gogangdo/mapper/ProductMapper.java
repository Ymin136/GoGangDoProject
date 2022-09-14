package com.gogangdo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.ReviewDTO;
import com.gogangdo.dto.FileDTO;
import com.gogangdo.dto.ProductDTO;

@Mapper
public interface ProductMapper {



	List<ProductDTO> selectProductList(int pageNo);


	int selectProductCount();


	List<ProductDTO> selectProductLowPrice(int product_price);


	FileDTO selectImageFile(int fno);


	List<ProductDTO> selectProductList(int pageNo, int category_no);

	//JYM
	int selectProductNo();
	void registerProduct(ProductDTO dto);
	void insertthumbnail(FileDTO fileDTO);
	void insertproduct_img(FileDTO fileDTO);
	int selectImageNo();
	ProductDTO selectproductDTO(int product_no);
	FileDTO selectThumbnailDTO(int product_no);
	FileDTO selectimageDTO(int product_no);
	List<ReviewDTO> selectReviewList(Map<String, Integer> map);

	List<ProductDTO> selectProductSubList(Map<Object, Object> map);

	int selectReviewCount(int product_no);



}
