package com.kgu.www;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kgu.www.service.BoardService;
import com.kgu.www.vo.BoardCommentVO;
import com.kgu.www.vo.BoardPagingVO;
import com.kgu.www.vo.FreeBoardVO;

@Controller
public class BoardController {
	@Resource(name = "KguBoardService")
	private BoardService kguBoardService;
	
	@Resource(name="boardUploadPath")
	String uploadPath;
	BoardPagingVO boardPagingVO = new BoardPagingVO(10, 5);
	BoardPagingVO boardCommentPagingVO = new BoardPagingVO(10, 5);
	
	/////////////////////////////////////////////////////////
	
	//글목록 페이지 출력
	@RequestMapping(value = "/FreeBoard_List.do")
	public String freeBoard_List(Model model, HttpServletRequest request) {
		System.out.println("FreeBoard_List.do");
		int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		boardPagingVO.setSearchType(searchType);
		
		if(searchKeyword == null || searchKeyword.equals(""))
			boardPagingVO.setSearchKeyword("");
		else
			boardPagingVO.setSearchKeyword(searchKeyword);
		
		ArrayList<FreeBoardVO> fbList = kguBoardService.FreeboardALL(boardPagingVO);
		for(FreeBoardVO fb : fbList) {
			fb.setRegDate(fb.getRegDate().substring(2));
		}
		boardPagingVO.setTotalCnt(fbList.size());
		boardPagingVO.setPageNum(pageNum);
		
		model.addAttribute("fbList", fbList);
		model.addAttribute("boardPagingVO", boardPagingVO);
		
		return "board/FreeBoard_List";
	}
	
	//글 상세내용 페이지 출력
	@RequestMapping(value = "/FreeBoard_Content.do")
	public String freeBoard_Content(Model model, HttpServletRequest request) {
		System.out.println("FreeBoard_Content.do");
		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		
		FreeBoardVO fbContent = kguBoardService.getFreeboardContent(contentNum);
		fbContent.setRegDate(fbContent.getRegDate().substring(2));
		
		ArrayList<BoardCommentVO> fbComment = kguBoardService.getFreeboardComment(contentNum);
		for(BoardCommentVO comment : fbComment) {
			comment.setRegDate(comment.getRegDate().substring(2));
		}
		
		int cPageNum;
		if(request.getParameter("cPage") == null) {
			cPageNum = 1;
			kguBoardService.updateFreeboardHit(contentNum);
		} else {
			cPageNum = Integer.parseInt(request.getParameter("cPage"));
		}
		
		boardCommentPagingVO.setTotalCnt(fbComment.size());
		boardCommentPagingVO.setPageNum(cPageNum);
		
		model.addAttribute("fbContent", fbContent);
		model.addAttribute("fbComment", fbComment);
		model.addAttribute("boardCommentPagingVO", boardCommentPagingVO);
		
		return "board/FreeBoard_Content";
	}
	
	//글 상세내용 페이지 댓글등록
	@RequestMapping(value = "/FreeBoard_Content_CommentUpload.do")
	public String freeBoard_Content_CommentUpload(HttpServletRequest request) {
		System.out.println("FreeBoard_Content_CommentUpload.do");
		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		int cPagenum = Integer.parseInt(request.getParameter("cPage"));
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		String fbComm = request.getParameter("fbComment");
		String regDate = dateFormat.format(date);
		String fbCommPW = request.getParameter("fbCommentPW");
		
		BoardCommentVO boardCommentVO = new BoardCommentVO(contentNum, "", "익명", fbComm, regDate, fbCommPW);
		kguBoardService.insertFreeboardComment(boardCommentVO);
		kguBoardService.updateFreeboardcommentCnt(contentNum);
		
		return "redirect:/FreeBoard_Content.do?cNum="+contentNum+"&cPage="+cPagenum;
	}
	
	//글등록 페이지 출력
	@RequestMapping(value = "/FreeBoard_Write.do")
	public String freeBoard_Write(Model model) {
		System.out.println("FreeBoard_Write.do");
		return "board/FreeBoard_Write";
	}
	
	//글 상세내용 페이지 글삭제
	@RequestMapping(value = "/FreeBoard_Delete.do")
	public String freeBoard_Delete(HttpServletRequest request) {
		System.out.println("FreeBoard_Delete.do");
		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		
		kguBoardService.deleteFreeboardComment(contentNum);
		kguBoardService.deleteFreeboardContent(contentNum);
		
		return "redirect:/FreeBoard_List.do";
	}
	
	//글등록 페이지 글등록(작성중)
	@RequestMapping(value = "/FreeBoard_Upload.do", method=RequestMethod.POST)
	public String freeBoard_Upload(Model model, MultipartFile file) throws IOException {
		System.out.println("FreeBoard_Upload.do");
		String fileName = file.getOriginalFilename();
		fileName = uploadFile(fileName, file.getBytes());
		
		model.addAttribute("fileName", fileName);
		
		return "board/uploadTest";
	}
	
	//업로드 파일명 랜덤부여 메소드(작성중)
	private String uploadFile(String originalName, byte[] fileData) throws IOException {
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString() + "_" + originalName;
		
		File target = new File(uploadPath, fileName);
		FileCopyUtils.copy(fileData, target);
		
		return fileName;
	}
	
	/////////////////////////////////////////////////////////
	
}
