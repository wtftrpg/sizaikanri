package co.jp.mamol.myapp.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import co.jp.mamol.myapp.dto.CategoryDto;
import co.jp.mamol.myapp.dto.SizaiDto;
import co.jp.mamol.myapp.form.BuyRequestDetailForm;
import co.jp.mamol.myapp.service.BuyRequestService;

@Results({
	@Result(name = "requestDetail", location = "/WEB-INF/jsp/requestDetail.jsp")
})

public class BuyRequestDetailAction extends BaseAction {
	private BuyRequestDetailForm form = new BuyRequestDetailForm();
	
	@Autowired
	private BuyRequestService service;
	
//	初期表示！！！！！！！！！！！！！！！！！！１１
	@Action("/requestDetail/init")
	public String init() {
		
		SizaiDto s = service.getRequest(form.getId());
		
		List<CategoryDto> list = service.getCategory();
		
		form.setSizaiDto(s);
		
		form.setCategoryList(list);
		
		if (!s.getStatus().equals("1") && !s.getStatus().equals("3")) {
			form.setFlag(false);
			setMessage("承認済の依頼を変更できません。", false);
		} else {
			form.setFlag(true);
		}
		return "requestDetail";
		
	}
	
	//変更
	@Action("/requestDetail/modify")
	public String modify() {

		//変更実施
		if(service.modifyRequest(form.getSizaiDto())) {
			setMessage("変更完了しました。", true);
		}else {
			setMessage("変更できませんでした。", false);
		}

		//表示情報更新
		SizaiDto s = service.getRequest(form.getSizaiDto().getId());
		List<CategoryDto> list = service.getCategory();
		form.setSizaiDto(s);
		form.setCategoryList(list);
		form.setFlag(true);


		return "requestDetail";
	}

	/**
	 * @return form
	 */
	public BuyRequestDetailForm getForm() {
		return form;
	}

	/**
	 * @param form セットする form
	 */
	public void setForm(BuyRequestDetailForm form) {
		this.form = form;
	}
	
	

}
