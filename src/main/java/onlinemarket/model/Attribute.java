package onlinemarket.model;
// default package
// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Attribute generated by hbm2java
 */
@Entity
@Table(name = "tb_attribute", schema = "dbo", catalog = "SmartMarket")
public class Attribute implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private AttributeGroup attributeGroup;
	private String name;
	private String description;
	private Set<ProductAttribute> productAttributes = new HashSet<ProductAttribute>(0);

	public Attribute() {
	}

	public Attribute(AttributeGroup attributeGroup, String name) {
		this.attributeGroup = attributeGroup;
		this.name = name;
	}

	public Attribute(AttributeGroup attributeGroup, String name, String description,
			Set<ProductAttribute> productAttributes) {
		this.attributeGroup = attributeGroup;
		this.name = name;
		this.description = description;
		this.productAttributes = productAttributes;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "_id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "attribute_group_id", nullable = false)
	public AttributeGroup getAttributeGroup() {
		return this.attributeGroup;
	}

	public void setAttributeGroup(AttributeGroup attributeGroup) {
		this.attributeGroup = attributeGroup;
	}

	@Column(name = "[name]", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "attribute")
	public Set<ProductAttribute> getProductAttributes() {
		return this.productAttributes;
	}

	public void setProductAttributes(Set<ProductAttribute> productAttributes) {
		this.productAttributes = productAttributes;
	}

}