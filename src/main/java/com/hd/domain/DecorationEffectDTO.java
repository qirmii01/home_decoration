package com.hd.domain;

import java.util.List;

public class DecorationEffectDTO extends DecorationEffect{
	private static final long serialVersionUID = 1L;
	private List<DecorationEffectKey> decorationEffectKeys;
	private List<DecorationEffectImg> decorationEffectImgs;
	public List<DecorationEffectKey> getDecorationEffectKeys() {
		return decorationEffectKeys;
	}
	public void setDecorationEffectKeys(
			List<DecorationEffectKey> decorationEffectKeys) {
		this.decorationEffectKeys = decorationEffectKeys;
	}
	public List<DecorationEffectImg> getDecorationEffectImgs() {
		return decorationEffectImgs;
	}
	public void setDecorationEffectImgs(
			List<DecorationEffectImg> decorationEffectImgs) {
		this.decorationEffectImgs = decorationEffectImgs;
	}
}
