package com.estate.business.service;

import java.util.List;

import com.estate.domain.TdDefination;

public interface DefinationService {

	public void saveOrUpdate(TdDefination defination);

	public TdDefination read(Long id);

	public List<TdDefination> findAll();

	public void delete(String ids);
}
