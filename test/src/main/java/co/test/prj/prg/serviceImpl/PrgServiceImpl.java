package co.test.prj.prg.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.prg.service.PrgMapper;
import co.test.prj.prg.service.PrgService;
import co.test.prj.prg.service.PrgVO;

@Repository("prgDao")
public class PrgServiceImpl implements PrgService {

	@Autowired
	private PrgMapper map;

	@Override
	public List<PrgVO> midCtgSelectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PrgVO> smlCtgSelectList(int prg_clsfc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PrgVO selectList(int prg_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int midCtgInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int smlCtgInsert(int prg_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ctgUpdate(int prg_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ctgDelete(int prg_id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
