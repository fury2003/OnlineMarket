package onlinemarket.controller.admin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import onlinemarket.controller.MainController;
import onlinemarket.form.filter.FilterForm;
import onlinemarket.model.Attribute;
import onlinemarket.model.AttributeGroup;
import onlinemarket.model.ProductCategory;
import onlinemarket.service.AttributeGroupService;
import onlinemarket.service.AttributeService;
import onlinemarket.service.ProductCategoryService;

@Controller
@RequestMapping("/admin/product-category/{id:^\\d++}/attribute-group")
public class AttributeGroupController extends MainController{

	@Autowired
	AttributeGroupService attributeGroupService;
	
	@Autowired
	AttributeService attributeService;
	
	@Autowired
	ProductCategoryService productCategoryService;
	
	ProductCategory productCategory;
	
	String relativePath;
	
	FilterForm filterForm;
	
	@ModelAttribute
	public ModelMap populateAttribute(
			@PathVariable("id") Integer id,
			ModelMap model) {
		
		productCategory = productCategoryService.getByKey(id);
		relativePath = buildRelativePath(id);
		filterForm = new FilterForm();
		
		model.put("productCategoryPage", true);
		model.put("filterForm", filterForm);
		
		model.put("path", "product-category");
		model.put("productCategory", productCategory);
		model.put("filterForm", filterForm);
		model.put("relativePath", relativePath);
		model.put("pathAdd", relativePath+"/add");
		
		return model;
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mainPage(ModelMap model, RedirectAttributes redirectAttributes){
		
		filterForm.setOrderBy("priority");
		filterForm.setOrder("asc");
		
		if(productCategory == null) {
			redirectAttributes.addFlashAttribute("error", "Product category not found.");
			return "redirect:/admin/product-category";
		}
		
		model.put("pageTitle", "Attribute group manager for "+ productCategory.getName());
		model.put("result", attributeGroupService.listByProductCategory(productCategory, filterForm));
		model.put("filterForm", filterForm);
		
		return "backend/attribute-group";
	}
	
	
	@RequestMapping(value = "/page/{page:^\\d+}", method = RequestMethod.GET)
	public String mainPagePagination(
			@PathVariable("page") Integer page,
			ModelMap model, RedirectAttributes redirectAttributes){
		
		filterForm.setCurrentPage(page);
		filterForm.setOrderBy("priority");
		filterForm.setOrder("asc");
		
		if(productCategory == null) {
			redirectAttributes.addFlashAttribute("error", "Product category not found.");
			return "redirect:/admin/product-category";
		}
		
		model.put("pageTitle", "Attribute group manager for "+ productCategory.getName());
		model.put("result", attributeGroupService.listByProductCategory(productCategory, filterForm));
		model.put("filterForm", filterForm);
		
		return "backend/attribute-group";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addPage(
			ModelMap model, RedirectAttributes redirectAttributes) {
		
		if(productCategory == null) {
			redirectAttributes.addFlashAttribute("error", "Product category not found.");
			return "redirect:/admin/product-category";
		}
		
		model.put("subPageTitle", "Add for "+ productCategory.getName());
		model.put("description", "Add attribute group for "+ productCategory.getName());
		model.put("pageTitle", "Add new attribute group");
		model.put("action", "add");
		model.put("pathAction", relativePath+"/add");
		model.put("attributeGroup", new AttributeGroup());
		
		return "backend/attribute-group-add";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String processAddPage(
			@ModelAttribute("attributeGroup") @Valid AttributeGroup attributeGroup,
			BindingResult result, ModelMap model, 
			RedirectAttributes redirectAttributes) {
		
		if(productCategory == null) {
			redirectAttributes.addFlashAttribute("error", "Product category not found.");
			return "redirect:/admin/product-category";
		}
		
		if (!result.hasErrors()) {
			attributeGroup.setProductCategory(productCategory);
			redirectAttributes.addFlashAttribute("success", "");
			attributeGroupService.save(attributeGroup);
			return "redirect:"+relativePath;
		}
		
		model.put("subPageTitle", "Add for "+ productCategory.getName());
		model.put("description", "Add attribute group for "+ productCategory.getName());
		model.put("pageTitle", "Add new attribute group");
		model.put("provincePage", true);
		model.put("path", "product-category");
		model.put("action", "add");
		model.put("pathAction", relativePath+"/add");
		model.put("attributeGroup", attributeGroup);
		
		return "backend/attribute-group-add";
	}
	
	@RequestMapping(value = "/update/{idAttr:^\\d+}", method = RequestMethod.GET)
	public String updatePage(
			@PathVariable("idAttr") int idAttr, 
			ModelMap model,
			RedirectAttributes redirectAttributes) {

		if(productCategory == null) {
			redirectAttributes.addFlashAttribute("error", "Product category not found.");
			return "redirect:/admin/product-category";
		}
		
		AttributeGroup attributeGroup = attributeGroupService.getByKey(idAttr);
		if (attributeGroup == null) {
			redirectAttributes.addFlashAttribute("error", "Attribute group not found.");
			return "redirect:"+relativePath;
		}
		
		model.put("subPageTitle", "Update for "+ productCategory.getName());
		model.put("description", "Update attribute group for"+ productCategory.getName());
		model.put("pageTitle", "Update attribute group");
		model.put("action", "update");
		model.put("pathAction", relativePath+"/update/"+idAttr);
		model.put("attributeGroup", attributeGroup);
		
		return "backend/attribute-group-add";
		
	}

	
	@RequestMapping(value = "/update/{idAtt:^\\d+}", method = RequestMethod.POST)
	public String processUpdatePage(
			@PathVariable("idAttr") int idAttr,
			@ModelAttribute("attributeGroup") @Valid AttributeGroup attributeGroup,
			BindingResult result, ModelMap model, RedirectAttributes redirectAttributes) {
		
			if(productCategory == null) {
				redirectAttributes.addFlashAttribute("error", "Product category not found.");
				return "redirect:/admin/product-category";
			}
			
			AttributeGroup attributeGroupCheck = attributeGroupService.getByKey(idAttr);
			if (attributeGroupCheck == null) {
				redirectAttributes.addFlashAttribute("error", "Attribute group not found.");
				return "redirect:"+relativePath;
			}
			
			if (!result.hasErrors()) {
				attributeGroupService.update(attributeGroup);
				redirectAttributes.addFlashAttribute("success", "");
				return "redirect:"+relativePath;
			}
			
			model.put("subPageTitle", "Update for "+ productCategory.getName());
			model.put("description", "Update attribute group for"+ productCategory.getName());
			model.put("pageTitle", "Update attribute group");
			model.put("action", "update");
			model.put("pathAction", relativePath+"/update/"+idAttr);
			model.put("attributeGroup", attributeGroup);
			
			return "backend/attribute-group-add";
	}
	
	@RequestMapping(value = "/delete", method = {RequestMethod.POST, RequestMethod.GET})
	public String processDeleteProvince(
			@RequestParam(value = "id", required = true) Integer idAttr,
			RedirectAttributes redirectAttributes) {
			
		if(idAttr == null) {
			redirectAttributes.addAttribute("error", "Program wasn't gotten attibute group id!");
			return "redirect:"+relativePath;
		}
		
		AttributeGroup attributeGroup = attributeGroupService.getByKey(idAttr);
		if (attributeGroup == null) {
			redirectAttributes.addAttribute("error", "The attribute group isn't been exist!");
		}else {
			Attribute attribute = attributeService.getByAttributeGroup(attributeGroup);
			if(attribute != null)
				redirectAttributes.addAttribute("error", "The attribute group has already been had attribute!");
			else {
				redirectAttributes.addFlashAttribute("success", "success");
				attributeGroupService.delete(attributeGroup);
			}
		}
		return "redirect:"+relativePath;
	}
	
	public String buildRelativePath(int id) {
		return "/admin/product-category/"+id+"/attribute-group";
	}
}
