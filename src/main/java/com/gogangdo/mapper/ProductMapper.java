package com.gogangdo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.FileDTO;
import com.gogangdo.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	int selectProductNo();
	void registerProduct(ProductDTO dto);
	void insertthumbnail(FileDTO fileDTO);
	void insertproduct_img(FileDTO fileDTO);
	int selectImageNo();
	ProductDTO selectproductDTO(int product_no);
	FileDTO selectThumbnailDTO(int product_no);
	FileDTO selectimageDTO(int product_no);
	FileDTO selectImageFile(int fno);


	List<ProductDTO> selectProductList(int pageNo);


	int selectProductCount();


	List<ProductDTO> selectProductLowPrice(int product_price);

}
