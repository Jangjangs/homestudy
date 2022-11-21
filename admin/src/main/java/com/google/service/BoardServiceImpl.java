package com.google.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.google.domain.BoardVO;
import com.google.domain.Criteria;
import com.google.mapper.BoardMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class BoardServiceImpl implements BoardService{

	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList() {
		
		return mapper.getList();
	}
	
	@Override
	public void register(BoardVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public BoardVO get(long bno) {
		mapper.updatehit(bno);
		return mapper.read(bno);
	}

	@Override
	public void remove(long bno) {
		mapper.delete(bno);
		
	}

	@Override
	public void modify(BoardVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getListTotal(Criteria cri) {
		
		return mapper.getListTotal(cri);
	}


}
