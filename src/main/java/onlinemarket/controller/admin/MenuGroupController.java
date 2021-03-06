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
import onlinemarket.model.MenuGroup;
import onlinemarket.service.MenuGroupService;

@Controller
@RequestMapping("/admin/menu-group")
public class MenuGroupController extends MainController {

	@Autowired
	MenuGroupService menuGroupService;

	String relativePath;

	FilterForm filterForm;

	@ModelAttribute
	public ModelMap populateAttribute(@PathVariable("id") Integer id, ModelMap model) {

		relativePath = "/admin/menu-group";
		filterForm = new FilterForm();

		model.put("productCategoryPage", true);
		model.put("filterForm", filterForm);

		model.put("path", "product-category");
		model.put("filterForm", filterForm);
		model.put("relativePath", relativePath);
		model.put("pathAdd", relativePath + "/add");

		return model;
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mainPage(ModelMap model, RedirectAttributes redirectAttributes) {

		model.put("pageTitle", "Menu group manager");
		model.put("result", menuGroupService.list(filterForm));
		model.put("filterForm", filterForm);

		return "backend/menu-group";
	}

	@RequestMapping(value = "/page/{page:^\\d+}", method = RequestMethod.GET)
	public String mainPagePagination(@PathVariable("page") Integer page, ModelMap model) {

		filterForm.setCurrentPage(page);
		filterForm.setOrderBy("priority");
		filterForm.setOrder("asc");

		model.put("pageTitle", "Menu group manager");
		model.put("result", menuGroupService.list(filterForm));
		model.put("filterForm", filterForm);

		return "backend/menu-group";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addPage(ModelMap model) {

		model.put("subPageTitle", "Add new menu group");
		model.put("description", "Information fo menu group");
		model.put("pageTitle", "Add new menu group");
		model.put("action", "add");
		model.put("pathAction", relativePath + "/add");
		model.put("attributeGroup", new MenuGroup());

		return "backend/menu-group-add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String processAddPage(@ModelAttribute("menuGroup") @Valid MenuGroup menuGroup,
			BindingResult result, ModelMap model, RedirectAttributes redirectAttributes) {

		if (!result.hasErrors()) {
			redirectAttributes.addFlashAttribute("success", "");
			menuGroupService.save(menuGroup);
			return "redirect:" + relativePath;
		}

		model.put("subPageTitle", "Add new menu group");
		model.put("description", "Information fo menu group");
		model.put("pageTitle", "Add new menu group");
		model.put("action", "add");
		model.put("pathAction", relativePath + "/add");
		model.put("menuGroup", menuGroup);

		return "backend/menu-group-add";
	}

	@RequestMapping(value = "/update/{idAttr:^\\d+}", method = RequestMethod.GET)
	public String updatePage(@PathVariable("idMenuGroup") int idMenuGroup, ModelMap model,
			RedirectAttributes redirectAttributes) {

		MenuGroup menuGroup = menuGroupService.getByKey(idMenuGroup);
		if (menuGroup == null) {
			redirectAttributes.addFlashAttribute("error", "Menu group not found.");
			return "redirect:" + relativePath;
		}

		model.put("subPageTitle", "Update menu group");
		model.put("description", "Information fo menu group");
		model.put("pageTitle", "Update menu group");
		model.put("action", "add");
		model.put("pathAction", relativePath + "/update/" + idMenuGroup);
		model.put("menuGroup", menuGroup);

		return "backend/menu-group-add";

	}

	@RequestMapping(value = "/update/{idAtt:^\\d+}", method = RequestMethod.POST)
	public String processUpdatePage(@PathVariable("idMenuGroup") int idMenuGroup,
			@ModelAttribute("attributeGroup") @Valid MenuGroup menuGroup, BindingResult result,
			ModelMap model, RedirectAttributes redirectAttributes) {

		MenuGroup menuGroupCheck = menuGroupService.getByKey(idMenuGroup);
		if (menuGroupCheck == null) {
			redirectAttributes.addFlashAttribute("error", "Menu group not found.");
			return "redirect:" + relativePath;
		}
		
		if (!result.hasErrors()) {
			redirectAttributes.addFlashAttribute("success", "");
			menuGroupService.update(menuGroup);
			return "redirect:" + relativePath;
		}
		
		model.put("subPageTitle", "Update menu group");
		model.put("description", "Information fo menu group");
		model.put("pageTitle", "Update menu group");
		model.put("action", "add");
		model.put("pathAction", relativePath + "/update/" + idMenuGroup);
		model.put("menuGroup", menuGroup);
		
		return "backend/menu-group-add";
	}

	@RequestMapping(value = "/delete", method = { RequestMethod.POST, RequestMethod.GET })
	public String processDeleteProvince(@RequestParam(value = "id", required = true) Integer idMenuGroup,
			RedirectAttributes redirectAttributes) {

		if (idMenuGroup == null) {
			redirectAttributes.addAttribute("error", "Program wasn't gotten attibute group id!");
			return "redirect:" + relativePath;
		}
		
		MenuGroup menuGroupCheck = menuGroupService.getByKey(idMenuGroup);
		if (menuGroupCheck == null) {
			redirectAttributes.addFlashAttribute("error", "Menu group not found.");
			return "redirect:" + relativePath;
		}
		
		menuGroupService.delete(menuGroupCheck);
		
		return "redirect:" + relativePath;
	}
}
