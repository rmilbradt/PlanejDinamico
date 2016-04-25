package br.ufsm.ceesp.beans;

import br.ufsm.ceesp.model.teste.Servico;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

/**
 * Created by politecnico on 02/03/2016.
 */
@Repository
public class ServicoDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Collection<Servico> findServicosDia(Date dia) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Servico.class);

        if (dia != null) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(dia);
            cal.set(Calendar.HOUR_OF_DAY, 0);
            cal.set(Calendar.MINUTE, 0);
            cal.set(Calendar.SECOND, 0);
            cal.set(Calendar.MILLISECOND, 0);
            Date dataInicial = cal.getTime();

            cal.set(Calendar.HOUR_OF_DAY, cal.getActualMaximum(Calendar.HOUR_OF_DAY));
            cal.set(Calendar.MINUTE, cal.getActualMaximum(Calendar.MINUTE));
            cal.set(Calendar.SECOND, cal.getActualMaximum(Calendar.SECOND));
            cal.set(Calendar.MILLISECOND, cal.getActualMaximum(Calendar.MILLISECOND));

            Date dataFinal = cal.getTime();
            criteria.add(Restrictions.between("dataRealizacao", dataInicial, dataFinal));
        }

        return criteria.list();
    }

    @Transactional
    public void criaServico(Servico servico) {
        sessionFactory.getCurrentSession().save(servico);
    }

    @Transactional
    public Servico findServicoById(Long id) {
        return (Servico) sessionFactory.getCurrentSession().get(Servico.class, id);
    }

}
