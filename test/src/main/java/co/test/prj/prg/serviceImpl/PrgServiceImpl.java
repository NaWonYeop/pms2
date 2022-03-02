package co.test.prj.prg.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.prg.service.PrgMapper;
import co.test.prj.prg.service.PrgService;
import co.test.prj.prg.service.PrgVO;
import co.test.prj.team.service.PrjVO;

@Repository("prgDao")
public class PrgServiceImpl implements PrgService {

	@Autowired
	private PrgMapper map;

	@Override
	public List<PrgVO> prgSelectNullList(PrgVO prj) {
		// TODO Auto-generated method stub
		return null;
	}

}
