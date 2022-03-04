package co.test.prj.prg.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.prg.service.PrgMapper;
import co.test.prj.prg.service.PrgService;
import co.test.prj.prg.service.PrgVO;
import co.test.prj.team.service.MyPrjVO;

@Repository("prgDao")
public class PrgServiceImpl implements PrgService {

	@Autowired
	private PrgMapper map;

	@Override
	public List<PrgVO> prgSelectList(int prj_id) {
		// TODO Auto-generated method stub
		return map.prgSelectList(prj_id);
	}

	@Override
	public int prgInsert(PrgVO prg) {
		// TODO Auto-generated method stub
		return map.prgInsert(prg);
	}

	@Override
	public int prgUpdate(PrgVO prg) {
		// TODO Auto-generated method stub
		return map.prgUpdate(prg);
	}

	@Override
	public int smlUpdate(PrgVO prg) {
		// TODO Auto-generated method stub
		return map.smlUpdate(prg);
	}
	
	@Override
	public int prgDelete(PrgVO prg) {
		// TODO Auto-generated method stub
		map.prgDelete(prg);
		map.smlUpdate(prg);
		return 0;
	}

	

}
