package onlinemarket.dao;

import java.io.Serializable;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import onlinemarket.form.filter.FilterForm;
import onlinemarket.result.ResultObject;

public abstract class AbstractDao<PK extends Serializable, T> {
    
    private final Class<T> persistentClass;
     
    @SuppressWarnings("unchecked")
    public AbstractDao(){
        this.persistentClass =(Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
    }
     
    @Autowired
    private SessionFactory sessionFactory;
 
    protected Session getSession(){
        return sessionFactory.getCurrentSession();
    }
 
    @SuppressWarnings("unchecked")
    public T getByKey(PK key) {
        return (T) getSession().get(persistentClass, key);
    }
    
    @SuppressWarnings("unchecked")
	public T getByDeclaration(String key, String value) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq(key, value));
		return (T) criteria.uniqueResult();
	}
 
    public void persist(T entity) {
        getSession().persist(entity);
    }
    
    public Serializable save(T entity) {
        return getSession().save(entity);
    }
    
    public void update(T entity) {
        getSession().update(entity);
    }
    
    public void delete(T entity) {
        getSession().delete(entity);
    }
 
    @SuppressWarnings("unchecked")
	public List<T> list(){
		Criteria criteria = createEntityCriteria();
		return (List<T>) criteria.list();
    }
    
	public long count(){
		Criteria criteria = createEntityCriteria();
		criteria.setProjection(Projections.rowCount());
		return (long) criteria.uniqueResult();
    }
    
    @SuppressWarnings("unchecked")
	public List<T> listByInList(String key, List<String> listValue){
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.in(key, listValue));
		return (List<T>) criteria.list();
    }
    
    protected Criteria createEntityCriteria(){
        return getSession().createCriteria(persistentClass);
    }
    
	@SuppressWarnings("unchecked")
	public List<T> list(Integer offset, Integer maxResults) {
		return (List<T>) createEntityCriteria().setFirstResult(offset != null ? offset : 0)
				.setMaxResults(maxResults != null ? maxResults : 10).list();
	}
	
	@SuppressWarnings("unchecked")
	public ResultObject<T> list(FilterForm filterForm){
		
		Criteria criteria = createEntityCriteria();
		ResultObject<T> result = new ResultObject<>();
		
		if(StringUtils.isNotBlank(filterForm.getSearch()) && StringUtils.isNotBlank(filterForm.getSearchBy())) {
			criteria.add(Restrictions.like(filterForm.getSearchBy(), filterForm.getSearch()));
		}
		
		criteria.setProjection(Projections.rowCount());
		Long count = (Long) criteria.uniqueResult();
		if(count != null ) {
			int totalPages = (int) Math.ceil((float) count/filterForm.getSize());
			result.setTotalPages(totalPages);
		}else result.setTotalPages(0);
		
		if(filterForm.getSize() > 0 && filterForm.getCurrentPage() > 0) 
			criteria.setFirstResult((filterForm.getCurrentPage()- 1) * filterForm.getSize()).setMaxResults(filterForm.getSize());
		criteria.setProjection(null);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		
		if(StringUtils.isNotBlank(filterForm.getOrderBy()) && StringUtils.isNotBlank(filterForm.getOrder())) {
			if(filterForm.getOrder().equals("asc"))
				criteria.addOrder(Order.asc(filterForm.getOrderBy()));
			else
				criteria.addOrder(Order.desc(filterForm.getOrderBy()));
		}
		
		result.setList(criteria.list());
		
		result.setCurrentPage(filterForm.getCurrentPage());
		
		return result;
	}
}