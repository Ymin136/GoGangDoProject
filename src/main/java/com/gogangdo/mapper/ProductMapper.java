package com.gogangdo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.FileDTO;
import com.gogangdo.dto.ProductDTO;
import com.gogangdo.dto.QnADTO;
import com.gogangdo.dto.ReviewDTO;

@Mapper
public interface ProductMapper {


	//CHO
	List<ProductDTO> selectProductList(Map<Object, Object> map);
	int selectCategoryNo(int caregory_no);
	int selectProductCount(int category_no);
	int selectProductSubCount(int sub_category_no);

	List<ProductDTO> selectProductLowPrice(Map<Object, Object> map);
	List<ProductDTO> selectProductHighPrice(Map<Object, Object> map);
	FileDTO selectImageFile(int fno);
	List<ProductDTO> selectProductList(int pageNo, int category_no);
	int selectProductImageNo(int product_no);
	String selectProductName(int product_no);

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
	List<QnADTO> selectQnAList(Map<String, Integer> map);
	List<ProductDTO> selectProductSubList(Map<Object, Object> map);
	int selectReviewCount(int product_no);
	int selectQnACount(int product_no);
	int selectQnaNo();
	void insertQnA(QnADTO dto);

	List<QnADTO> selectQnaAllList(Map<String, Integer> map);


	int selectQnaAllCount(int answer_check);


	void insertQnaAnswser(QnADTO dto);


	List<ProductDTO> productSearchList(Map<String, Object> map);
	
	int selectProductNameCount(String search);

}
