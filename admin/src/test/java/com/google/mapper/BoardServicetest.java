package com.google.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.domain.BoardVO;
import com.google.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServicetest {
	
	@Setter(onMethod_={@Autowired})
	private BoardService service;
	
	//@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	//@Test
	public void testRegister() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새글제목2");
		vo.setContent("새글내용2");
		vo.setWriter("user00");
		
		service.register(vo);
	}
	
	//@Test
	public void testGetList() {
		service.getList().forEach(board->log.info(board));
	}
	
	@Test
	public void testget() {
		service.get(1);
	}
	
	//@Test
	public void testRemove() {
		service.remove(36);
	}
	
	//@Test
	public void testModify() {
		BoardVO vo = new BoardVO();
			vo.setBno(1);
			vo.setTitle("새글제목3");
			vo.setContent("새글내용3");
			vo.setWriter("user00");
			
		service.modify(vo);
	}
	
}
