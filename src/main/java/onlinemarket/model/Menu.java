package onlinemarket.model;
// default package
// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Menu generated by hbm2java
 */
@Entity
@Table(name = "tb_menu", schema = "dbo", catalog = "SmartMarket")
public class Menu implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private Menu menu;
	private MenuGroup menuGroup;
	private String path;
	private String description;
	private String icon;
	private String name;
	private int order;
	private Set<Menu> menus = new HashSet<Menu>(0);

	public Menu() {
	}

	public Menu(int id, MenuGroup menuGroup, String path, String name, int order) {
		this.id = id;
		this.menuGroup = menuGroup;
		this.path = path;
		this.name = name;
		this.order = order;
	}

	public Menu(int id, Menu menu, MenuGroup menuGroup, String path, String description, String icon,
			String name, int order, Set<Menu> menus) {
		this.id = id;
		this.menu = menu;
		this.menuGroup = menuGroup;
		this.path = path;
		this.description = description;
		this.icon = icon;
		this.name = name;
		this.order = order;
		this.menus = menus;
	}

	@Id

	@Column(name = "_id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	public Menu getMenu() {
		return this.menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "group_menu_id", nullable = false)
	public MenuGroup getMenuGroup() {
		return this.menuGroup;
	}

	public void setMenuGroup(MenuGroup menuGroup) {
		this.menuGroup = menuGroup;
	}

	@Column(name = "path", nullable = false, length = 2083)
	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "icon", length = 35)
	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "[name]", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "order", nullable = false)
	public int getOrder() {
		return this.order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "menu")
	public Set<Menu> getMenus() {
		return this.menus;
	}

	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}

}
