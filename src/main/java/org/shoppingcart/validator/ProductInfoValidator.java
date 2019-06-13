package org.shoppingcart.validator;

import org.shoppingcart.dao.ProductDAO;
import org.shoppingcart.entity.Product;
import org.shoppingcart.model.ProductInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ProductInfoValidator implements Validator {

	@Autowired
	ProductDAO productDAO;

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz == ProductInfo.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ProductInfo productInfo = (ProductInfo) target;

		// Check the fields of ProductInfo class.
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "NotEmpty.productForm.code");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.productForm.name");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "NotEmpty.productForm.price");

		String code = productInfo.getCode();
		if (code != null && code.length() > 0) {
			if (code.matches("\\s+")) {
				errors.rejectValue("code", "Pattern.productForm.code");
			} else if (productInfo.isNewProduct()) {
				Product product = productDAO.findProduct(code);
				if (product != null) {
					errors.rejectValue("code", "Duplicate.productForm.code");
				}
			}
		}
	}
}