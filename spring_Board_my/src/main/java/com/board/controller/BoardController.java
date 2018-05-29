package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.dto.BoardVO;
import com.board.dto.Criteria;
import com.board.dto.PageMaker;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired(required=false)
	private BoardService service;	
	
	@RequestMapping("/test")
	public void test(String name,Model model)throws Exception{
		model.addAttribute("name", name);
	}	
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public void registerGET()throws Exception{
		
	}
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(BoardVO board,RedirectAttributes rttr)throws Exception{
		service.create(board);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/listAll";
	}
	
	@RequestMapping("/listAll")
	public void listAll(Model model) throws Exception{
		List<BoardVO> boardList=service.listAll();
		model.addAttribute("list", boardList);
	}
	
	@RequestMapping("/read")
	public void read(int bno, Model model)throws Exception{
		BoardVO board=service.read(bno);
		model.addAttribute(board);		
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(int bno,Model model)throws Exception{
		BoardVO board=service.read(bno);
		model.addAttribute(board);
	}
	
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modifyPOST(BoardVO board, RedirectAttributes rttr)throws Exception{
		service.modify(board);
		rttr.addAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String delete(int bno, RedirectAttributes rttr)throws Exception{
		service.remove(bno);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listcri(Criteria cri,Model model)throws Exception{
		List<BoardVO> boardList = service.listCriteria(cri);
		model.addAttribute("list", boardList);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		int totalCount=service.listAll().size();
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
	}
	
}
