package com.xxx.oa.base;

import java.util.List;

import org.springframework.stereotype.Repository;
@Repository
public interface BaseDao<T> {
	
	/**
	 * add a member to DB
	 * @param entity
	 */
	void save(T entity);
	/**
	 * according to id to delete a member 
	 * @param id
	 */
	void delete(long id);
	/**
	 * update a member to DB
	 * @param entity
	 */
	void update(T entity);
	
	
	
	/**
	 * according to id to find member if id is null return null
	 * @param id
	 * @return
	 */
	T getById(Long id);
	
	
	
	
	/**
	 * find specific members(more than one)
	 * @param ids
	 * @return
	 */
	List<T> getByIds(Long[] ids);
	/**
	 * find all members
	 * @return
	 */
	List<T> findAll();
	
}
