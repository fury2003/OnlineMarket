package onlinemarket.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import onlinemarket.model.Product;
import onlinemarket.service.ProductService;

@Component
public class UniqueProductCategorySlugValidator implements ConstraintValidator<UniqueProductSlug, Object>{

	@Autowired
	ProductService productService;
	
	@Override
	public void initialize(UniqueProductSlug constraintAnnotation) {
		SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
	}

	@Override
	public boolean isValid(Object candidate, ConstraintValidatorContext context) {
		
		Product product = (Product) candidate;
		Product productMod = productService.getByDeclaration("slug", product.getSlug());
		boolean isValid = false;
		if(productMod == null) isValid = true;
		else if(StringUtils.equals(product.getSlug(), product.getBeforeSlug())) isValid = true;
		else isValid = false;
        if ( !isValid ) {
        	context.disableDefaultConstraintViolation();
        	context
                    .buildConstraintViolationWithTemplate( "{onlinemarket.isUniqueProductSlug}" )
                    .addPropertyNode( "slug" ).addConstraintViolation();
        }
		return isValid;
	}

}
