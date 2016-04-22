package br.ufsm.ceesp.beans;

import br.ufsm.ceesp.model.Equipe;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by politecnico on 22/04/2016.
 */
@Repository
public class EquipeDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Equipe findByCodigo(Long numero) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Equipe.class);
        criteria.add(Restrictions.eq("numero", numero));
        return (Equipe) criteria.uniqueResult();
    }

}
