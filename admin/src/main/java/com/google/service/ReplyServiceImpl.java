package com.google.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.domain.Criteria;
import com.google.domain.ReplyPageDTO;
import com.google.domain.ReplyVO;
import com.google.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= {@Autowired} )
	private ReplyMapper mapper;
	
	@Override
	public int insert(ReplyVO vo) {
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO read(long rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}

	@Override
	public int delete(long rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno);
	}

	@Override
	public int update(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public ReplyPageDTO getListWithPaging(Criteria cri, long bno) {
		// TODO Auto-generated method stub
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}

}
