package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.dto.BoardVO;
import com.board.dto.PageMaker;
import com.board.dto.SearchCriteria;
import com.board.service.BoardService;

@Controller
@RequestMapping("/sboard")
public class SearchBoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public void registerGET()throws Exception{}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(BoardVO board,RedirectAttributes rtts, SearchCriteria cri)
								throws Exception{
		service.create(board);
		rtts.addFlashAttribute("msg","success");
		rtts.addAttribute("page",cri.getPage());
		rtts.addAttribute("perPageNum",cri.getPerPageNum());
		rtts.addAttribute("searchType",cri.getSearchType());
		rtts.addAttribute("keyword",cri.getKeyword());
		
		rtts.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/sboard/listPage";
	}
	
	@RequestMapping(value="/listPage",method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri,Model model)throws Exception{
		List<BoardVO> boardList=service.listSearch(cri);
		model.addAttribute("list", boardList);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.readSearchBoardCount(cri));
		model.addAttribute(pageMaker);
	}
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void  readPage(@ModelAttribute("cri")SearchCriteria cri,int bno, Model model)throws Exception{
		BoardVO board=service.readByBno(bno);
		model.addAttribute(board);
		
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET)
	public void modifyPage(@ModelAttribute("cri")SearchCriteria cri,
							int bno, Model model)throws Exception{
		 BoardVO board=service.readByBno(bno);
		 model.addAttribute(board);
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	public String modfifyPagePOST(BoardVO board,SearchCriteria cri,
								RedirectAttributes rttr)
									throws Exception{
		service.modify(board);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/sboard/listPage";
	}
	
	@RequestMapping(value="/removePage",method=RequestMethod.POST)
	public String removePage(int bno,SearchCriteria cri,
							RedirectAttributes rttr)
							throws Exception{
		service.remove(bno);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/sboard/listPage";
	}
	
}
