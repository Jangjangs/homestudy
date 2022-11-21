package com.google.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.domain.Criteria;
import com.google.domain.ReplyPageDTO;
import com.google.domain.ReplyVO;
import com.google.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/replies/*")
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	/**
	 * http://localhost/admin/replies/new
	 *  댓글등록
	 *  @Param vo
	 *  @return
	 */
	@PostMapping(value = "/new", consumes = "application/json",
							produces = {MediaType.TEXT_PLAIN_VALUE})
	
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		int insertCount = service.insert(vo);
		return insertCount == 1
				? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	/**
	 * http://localhost/admin/replies/pages/3/1
	 * @param page
	 * @param bno
	 * @return
	 */
	@GetMapping(value="/pages/{bno}/{page}",produces = 
										{MediaType.APPLICATION_XML_VALUE,
										MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page,
												@PathVariable("bno") long bno){
	
		Criteria cri = new Criteria(page,10);
		return new ResponseEntity<ReplyPageDTO>(service.getListWithPaging(cri, bno), HttpStatus.OK);
	}
	
	/**
	 * http://localhost/admin/replies/5
	 * @param rno
	 * @return
	 */
	@GetMapping(value="/{rno}")
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") long rno){
		return new ResponseEntity<ReplyVO>(service.read(rno),HttpStatus.OK);
	}
	
	/**
	 * http://localhost/admin/replies/6
	 * @param rno
	 * @return
	 */
	@DeleteMapping(value="/{rno}")
	public ResponseEntity<String> remove(@PathVariable ("rno")long rno){
		int deleteCount = service.delete(rno);
		return deleteCount == 1
				? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	/**
	 * 
	 */
	@PutMapping(value="/{rno}")
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo,
										@PathVariable("rno") long rno){
		vo.setRno(rno);
		
		int updateCount = service.update(vo);
		
		return updateCount == 1
				? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
