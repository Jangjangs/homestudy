package com.google.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.domain.BoardVO;
import com.google.domain.Criteria;
import com.google.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Setter(onMethod_= {@Autowired})
	private ReplyMapper mapper;
	
	//@Test
	public void testGet() {
		log.info("REplyMapper...");
	}
	
	@Test
	public void getInsert() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(3);
		vo.setReply("댓글내용");
		vo.setReplyer("댓글작성자");
		mapper.insert(vo);
	}
	
	//@Test
		public void testRead() {
			mapper.read(1);
		}
		
	//@Test
	public void testRemove() {
		mapper.delete(1);
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 3);
		
		replies.forEach(reply-> log.info(reply));
	}
}
