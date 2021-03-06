package onlinemarket.service;

import onlinemarket.form.filter.FilterForm;
import onlinemarket.model.Event;
import onlinemarket.model.ProductCategory;
import onlinemarket.result.ResultObject;

public interface ProductCategoryService extends InterfaceService<Integer, ProductCategory>{

	public ResultObject<ProductCategory> list(FilterForm filterForm);
	
	public ProductCategory getByEvent(Event event);

}
