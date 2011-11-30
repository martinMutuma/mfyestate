package com.estate.base.support;

import java.util.HashMap;
import java.util.Map;

public class ParameterMetadata {
	private Map<Integer, Object> namedDescriptorMap;
	private int ordinalParameterCount = -1;

	@SuppressWarnings("unused")
	private ParameterMetadata() {
	}

	public ParameterMetadata(String sql) {
		operate(sql, 10);
		if (ordinalParameterCount > -1)
			namedDescriptorMap = new HashMap<Integer, Object>(
					ordinalParameterCount);
	}

	private void operate(String sql, int position) {
		ordinalParameterCount++;
		int positionTemp;
		if ((positionTemp = sql.indexOf("?", position)) != -1) {
			if (positionTemp > position)
				operate(sql, positionTemp);
		}
	}

	public Map<Integer, Object> getNamedDescriptorMap() {
		return namedDescriptorMap;
	}

	public void setNamedDescriptorMap(Map<Integer, Object> namedDescriptorMap) {
		this.namedDescriptorMap = namedDescriptorMap;
	}

	public int getOrdinalParameterCount() {
		return ordinalParameterCount;
	}

	public void setOrdinalParameterCount(int ordinalParameterCount) {
		this.ordinalParameterCount = ordinalParameterCount;
	}

}
